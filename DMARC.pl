#!/usr/bin/perl
#
=head1 NAME

DMARC.pl
 v1.1  22-Aug-2013
=head1 DESCRIPTION

DMARC (Domain-based Message Authentication, Reporting and Conformance) <http://www.dmarc.org/>
implementation for CommuniGate Pro mail server <http://www.communigate.com/CommuniGatePro/>

Implemented as an external filtering helper based on public Perl modules.

What it does:
1) checks the incoming message's "From:" header address.
  If the header is missing or the address is invalid - the message is rejected
2) checks the domain part of the "From:" address. 
  If the domain can't be resolved (no A/AAAA/MX record) - the message is rejected. 
  If there is no organizational domain for that domain - the message is rejected.
3) retrieves DMARC record for the domain.
  If there's no DMARC record - the message is released with OK answer.
4) checks the message's "Received-SPF:" header (should be added by CommuniGate)
5) checks the message's DKIM signature (if presents) using Mail::DKIM::Verifier module
  If either SPF or DKIM check passed - adds "DMARC: pass" header.
  If both failed - adds "DMARC: reject" (or rejects the message) or "quarantine" or "none" header according to DMARC policy.
6) saves the message data and periodically sends aggregate reports to the domain owner according to DMARC policy.


=head1 INSTALLATION

Modify the script's settings below the "YOU SHOLD REDEFINE THESE VARIABLES" line.

Configuring CommuniGate Pro:
1) In Settings->Mail->SMTP->Receiving page switch the "Check SPF records" to "Add Header".
   This is important because the script doesn't check SPF on its own but relies on CommuniGate's functionality.

2) Create a helper:
   Name: DMARC-scan
   Program Path: /usr/bin/perl DMARC.pl

3) Create a server-wide mail rule: 
   Data:
     [Submit Address] [is] [SMTP*]
     [Source] [is not] [authenticated]
   Action:
     [ExternalFilter] DMARC-scan
     
=head1 HISTORY

v1.0  24-Jun-2013
First public release

v1.1  22-Aug-2013
Bug fix: in reports some required parameters were not included in <policy_published> if they were not published in DMARC record.

=head1 AUTHORS

Roman Prokhorov <roma@communigate.com>

=cut


use strict;
use Net::DNS::Resolver;
use Email::Address;
use MIME::Base64 qw(encode_base64);
use Mail::DKIM::Verifier; # http://search.cpan.org/~jaslong/Mail-DKIM/lib/Mail/DKIM/Verifier.pm
use Archive::Zip qw( :ERROR_CODES :CONSTANTS );

####  YOU SHOLD REDEFINE THESE VARIABLES !!!

my $applyRejectPolicy=0; # Really reject if directed by DMARC policy or just add header
my $rejectBadFroms=1; # reject messages with bad "From:" headers 
my $sendReports=0; # send aggregate reports
 
my $Header="DMARC";

# the below parameters are required if $sendReports is true
my $reportOrg='MyCompany, Inc';
my $reportDomain='company.com';
my $reportEmail="noreply-dmarc-support\@$reportDomain";

my $reportsDir="DMARC_reports";  # a directory for collecting the reported data
my $SubmittedDir="Submitted"; # /var/CommuniGate/Submitted

#### end of the customizeable variables list


my $DNS_res;
my $publicSuffixList;
my $reportProcPID;
my $lockName="$reportsDir/file.lock";

$SIG{CHLD}='IGNORE';
$| = 1;
print "* DMARC.pl started.\n";


if($sendReports) {
  #require Archive::Zip;
  #import Archive::Zip qw( :ERROR_CODES :CONSTANTS );
  
  
  if($reportDomain eq 'company.com') {
    die "you must configure the script's parameters before launching it\n";
  }
  
  unless(-d $reportsDir) {
    unless(mkdir($reportsDir)) {
      die "can't create directory $reportsDir: @!";
    }
  }

  unless($reportProcPID=fork())  {
    die "cannot fork: $!" unless defined $reportProcPID;
    processReports();
    exit;  
  }
}

get_public_suffix_list();

while(<STDIN>) {
  chomp;
  my ($command,$prefix);
  my @args;             
  ($prefix,$command,@args) = split(/ /);
  if($command eq 'INTF') {
    print "$prefix INTF 3\n";

  } elsif($command eq 'QUIT') {
    print "$prefix OK\n";
    last; 
  } elsif($command eq 'KEY') {
    print "$prefix OK\n";
  } elsif($command eq 'FILE') {
    unless(my $pid = fork()) {
      die "cannot fork: $!" unless defined $pid;
      processFILE($prefix,$args[0]); 
      exit;  
    }

  } else {
    print "$prefix ERROR unexpected command: $command\n";
  }
}

kill('TERM', $reportProcPID) if($reportProcPID);
print "* stoppig DMARC.pl\n";
exit(0);




my @messageText;
my %DMARC_policy;
my ($fromDomain,$orgDomain,$returnPathDomain,$receivedSPF,$hasDKIMsignature,);

my ($dkimResult,$spfResult,$appliedPolicy)=('fail','fail','none');
my ($dkimResult2,$dkimHumanResult,$dkimDomain)=('none','','');
my ($spfResult2,$spfDomain)=('none','');

my @statusMessages;


sub processFILE {
  my ($prefix,$fileName) = @_;
  my ($fromAddress,$senderAddress,$isReport);
  my @envelopeRecipients; 
  
  unless( open (FILE,"$fileName")) {
    print qq/$prefix REJECTED can't open $fileName: $!\n/;
    return undef;
  }

  my $sourceIP='';
  while(<FILE>) { #read the envelope
    chomp;
    last if($_ eq '');
    if(/^P .*\@(.+)>/) {
      $returnPathDomain=lc($1);
    } elsif(/^R .*\@(.+)>/) {
      push(@envelopeRecipients,lc($1));
    } elsif(/^S .*\[(.+)\]/) {
      $sourceIP=$1;
    }
  }
  while(<FILE>) { #read the mesage
    chomp;
    s/\015$//;
    push(@messageText,$_);
  }
  close(FILE);

  for(my $i=0;$i<scalar @messageText;$i++) {
    my $h=$messageText[$i];
    while($i+1<scalar @messageText && $messageText[$i+1]=~/^\s+(.*)/) {
      $h.=" ".$1; $i++;
    }
    if($h=~/^DKIM-Signature:/i) {
      $hasDKIMsignature=1;
    } elsif($h=~/^From:\s*(.*)/i) {
      $fromAddress=lc($1) if(!$fromAddress);
    } elsif($h=~/^Sender:\s*(.*)/i) {
      $senderAddress=lc($1) if(!$senderAddress);
    } elsif($h=~/^Received-SPF:\s*(.*)/i) {
      $receivedSPF=lc($1) if(!$receivedSPF);
    } elsif($h=~/^Subject:\s*Report\s+Domain: .* Submitter: .* Report-ID:/i) { #skip reports from going into reports
      $isReport=1; 
    } elsif($h eq '') { #stop at the end of header
      last;
    }    
    
  }
  
  unless($fromAddress) {
    if($rejectBadFroms) {
      print qq/$prefix ERROR "no From: address"\n/;
    } else {
      print qq/$prefix ADDHEADER "$Header: no From: address"\n/;
    }  
    return undef;
  } else {
    my @addresses = Email::Address->parse($fromAddress);
    if($addresses[0]) {
      $fromDomain=$addresses[0]->host;
    } else {
      if($rejectBadFroms) {
        print qq/$prefix ERROR "malformed From: address"\n/;
      } else {
        print qq/$prefix ADDHEADER "$Header: malformed From: address"\n/;
      }  
      return undef;
    }  
  }
  
  $DNS_res = Net::DNS::Resolver->new(
    # nameservers => [qw(10.1.0.1)],
    tcp_timeout => 10,
    udp_timeout => 10,
  );

  unless(check_if_domain_exists($fromDomain)) {
    if($rejectBadFroms) {
      print qq/$prefix ERROR "non-existent domain ($fromDomain) in From:"\n/;
    } else {  
      print qq/$prefix ADDHEADER "$Header: non-existent domain ($fromDomain) in From:"\n/;
    }  
    return undef;
  }
  $orgDomain=get_organizational_domain($fromDomain);
  unless($orgDomain) {
    if($rejectBadFroms) {
      print qq/$prefix ERROR "can't find organizational domain for '$fromDomain'"\n/;
    } else {  
      print qq/$prefix ADDHEADER "$Header: can't find organizational domain for '$fromDomain'"\n/;
    }  
    return undef;
  }

  my $DMARC_rec;
  my $dmarcDomain=$fromDomain;
  
  # use organizational domain if DMARC record isn't found
  $DMARC_rec=get_DMARC_record($dmarcDomain);
  unless($DMARC_rec) {
    $dmarcDomain=$orgDomain;
    $DMARC_rec=get_DMARC_record($dmarcDomain);
  }
  
  unless($DMARC_rec) {
    #print qq/* ($prefix) no DMARC record for $fromDomain\n/;
    print qq/$prefix OK\n/;
    return undef;
  }
  print "* ($prefix) $fromDomain DMARC: $DMARC_rec\n";

  %DMARC_policy=map { /^(.*?)\s*=\s*(.*)$/ } split /\s*;\s*/, $DMARC_rec;
  #foreach(keys %DMARC_policy) { print " policy[$_]='$DMARC_policy{$_}'\n"; }
 
  if($DMARC_policy{pct}) {
    if($DMARC_policy{pct}!=100 && int(rand(100)) >= $DMARC_policy{pct}) {
      print qq/* ($prefix) not checked due to pct=$DMARC_policy{pct}\n/;
      print qq/$prefix OK\n/;
      return undef;
    }
  }
  
  verify_SPF();
  verify_DKIM();

  my $result=join("; ",@statusMessages);
  print "* ($prefix) DMARC result: $result\n";

  my ($policy,$disposition)=('none','none');

  $policy=$DMARC_policy{p} if($DMARC_policy{p});
  if($dmarcDomain ne $fromDomain) { #we're in dubdomain
    $policy=$DMARC_policy{sp} if($DMARC_policy{sp});  
  }
  
  if($dkimResult ne 'pass' && $spfResult ne 'pass') {
    if($policy eq 'reject') {
      if($applyRejectPolicy) {
        print qq/$prefix ERROR "DMARC check failed"\n/;
        $disposition='reject';
      } else {
        print qq/$prefix ADDHEADER "DMARC: reject"\n/;
        $disposition='quarantine';
      }
    }elsif($policy eq 'quarantine') {
      print qq/$prefix ADDHEADER "DMARC: quarantine"\n/;
      $disposition='quarantine';
    } else { #$policy==none
      print qq/$prefix ADDHEADER "DMARC: none"\n/;
    }
  } else {
    #print qq/$prefix OK\n/;
    print qq/$prefix ADDHEADER "DMARC: pass"\n/;
    $sendReports=0 if($isReport); #prevent adding report to reports
  } 

  if($sendReports && $DMARC_policy{rua}) {
    my @recipients;
    foreach(split /,/,$DMARC_policy{rua}) {
      if(/mailto:(\S*)/) {
        my ($addr0,$addr)=($1,$1);
        $addr=$1 if($addr0=~/(.*)!/);
        $addr=~/\@(.+)/;
        my $domain=$1;
        if($domain ne $fromDomain && $domain ne $orgDomain) {
          my $extRec=get_DMARC_record($domain,"$dmarcDomain._report.");
          unless($extRec) {
            print "* can't verify record for $dmarcDomain._report._dmarc.$domain\n";
            next;
          } else {
            my %extPolicy=map { /^(.*?)\s*=\s*(.*)$/ } split /\s*;\s*/, $extRec;
            if($extPolicy{rua}) {
              foreach(split /,/,$extPolicy{rua}) {
                if(/mailto:(\S*)/) {
                  my ($extAddr,$extAddr0)=($1,$1);
                  $extAddr=$1 if($extAddr0=~/(.*)!/);
                  $extAddr=~/\@(.+)/;
                  my $extDomain=$1;
                  if($extDomain eq $domain) {
                    push(@recipients,$extAddr0);
                  } else {
                    print "* external recipient $extAddr0 isn't in $domain\n";
                  }
                }
              }
            } else {
              push(@recipients,$addr0);
            }
          }
        } else {
          push(@recipients,$addr0);
        }  
      }
    }
    if(@recipients) {
      unless( open(LOCK_FILE,">$lockName") ) {
        print "* ($prefix) can't open $lockName: $!\n";
        return;
      }  
      flock(LOCK_FILE, 1 ); # shared lock
      
      my $fileName="$reportsDir/$dmarcDomain.data";
      unless( open(FILE,">>$fileName") ) {
        print "* ($prefix) can't open $fileName: $!\n";
      } else {
        flock(FILE, 2 ); # exclusive lock
        if(-z $fileName) {
          # version; domain; report time start/end;policy;recipients;
          my @policy;
          push(@policy,"adkim=$DMARC_policy{adkim}") if($DMARC_policy{adkim});
          push(@policy,"aspf=$DMARC_policy{aspf}") if($DMARC_policy{aspf});
          push(@policy,"p=$DMARC_policy{p}") if($DMARC_policy{p});
          push(@policy,"sp=$DMARC_policy{sp}") if($DMARC_policy{sp});
          push(@policy,"pct=$DMARC_policy{pct}") if($DMARC_policy{pct});
          
          print FILE "1;$dmarcDomain;".time().";". (time + ($DMARC_policy{ri} ? $DMARC_policy{ri} : 86400)).";".join(",",@policy).";".join(",",@recipients)."\n";
        }
        foreach(@envelopeRecipients) {
          print FILE "$sourceIP;$disposition;$dkimResult;$spfResult;$_;$fromDomain;$dkimDomain;$dkimResult2;$dkimHumanResult;$spfDomain;$spfResult2\n";
        }       
        close(FILE);
      }
      close(LOCK_FILE);
    }
  }

  return undef; 
}#processFile


sub verify_SPF {
  $spfResult='fail';
  $spfResult2=($receivedSPF=~/(^\S+)/)[0] || 'none';
  unless($spfResult2=~/^(none|neutral|pass|fail|softfail|temperror|permerror)$/) {
    if($spfResult2=~/error/) {
      $spfResult2='permerror';
    } else {
      $spfResult2='none';
    }
  }
  $spfDomain=$returnPathDomain;
  if($receivedSPF=~/^pass/) { # SPF check
    if($DMARC_policy{aspf} && $DMARC_policy{aspf} eq 's') { #check SPF alignment, strict policy
      if($fromDomain eq $returnPathDomain) {
        $spfResult='pass';
      } else {
        push(@statusMessages,"SPF strict alignment check failed");
      }
    } else { # relaxed policy
      if($orgDomain eq get_organizational_domain($returnPathDomain)) {
        $spfResult='pass';
      } else {
        push(@statusMessages,"SPF relaxed alignment check failed");
      }
    }
  } else { # SPF check failed or missing
    push(@statusMessages,($receivedSPF=~/^none/) ? "SPF result is \"none\"" : "SPF check failed");
  }
}

sub verify_DKIM {

  $dkimResult='fail';$dkimResult2='none';

  unless($hasDKIMsignature) { # if we have DKIM signature
    push(@statusMessages,"DKIM signature absent");
  } else {
    my $dkim = Mail::DKIM::Verifier->new();
    $dkim->PRINT("$_\015\012") foreach(@messageText);
    $dkim->CLOSE;
    my $result = $dkim->result;

    $dkimResult2=$result;
    unless($dkimResult2=~/^(none|pass|fail|policy|neutral|temperror|permerror)$/) {
      if($spfResult2=~/invalid/) {
        $spfResult2='permerror';
      } else {
        $spfResult2='fail';
      }
    }
    $dkimHumanResult = $dkim->result_detail;
    if($result eq 'pass') {
      $dkimDomain = $dkim->signature->domain();
      #print "* DKIM domain=$sigDomain\n";
      if($DMARC_policy{adkim} && $DMARC_policy{adkim} eq 's') { #check DKIM alignment, strict policy
        if($fromDomain eq $dkimDomain) {
          $dkimResult='pass';
        } else {
          push(@statusMessages,"DKIM strict alignment check failed");
        }
      } else { # relaxed policy
        if($orgDomain eq get_organizational_domain($dkimDomain)) {
          $dkimResult='pass'; 
        } else {
          push(@statusMessages,"DKIM relaxed alignment check failed");
        }
      }
      
    } else { # DKIM check failed
      push(@statusMessages,"DKIM check failed");
    }
  }
}

sub check_host {
  my ($host,$type)=@_;
  my $query=$DNS_res->query($host,$type);
  return 0 unless ($query);
  return 0 if($DNS_res->errorstring eq 'NXDOMAIN');
  1;
}

sub check_if_domain_exists {
  my ($host)=@_;
  return 1 if(check_host($host,'A'));
  return 1 if(check_host($host,'MX'));
  return 1 if(check_host($host,'AAAA'));
  0;
}

sub get_organizational_domain {
  my ($domain) = @_;
 
  my @labels = reverse split(/\./,$domain);
  my $greatest = 0;
  my $i;
  for ($i=0; $i<scalar @labels; $i++) {
    my $tld = join('.', reverse((@labels)[0 .. $i]) );
    if($publicSuffixList=~/^$tld$/m) {
      $greatest = $i + 1;
      next;
    } 
    # check for exceptional rule 
    if($publicSuffixList=~/^!$tld$/m) {
      $greatest = $i;
      next;
    }
   # check for templates with wildcards (eg: *.uk should match co.uk)
    $tld = join('.', '\*', reverse((@labels)[0 .. $i-1]));
    if ($publicSuffixList=~/^$tld$/m) {
      $greatest = $i + 1;
    }
  }
  return '' if($i == $greatest);
  if($greatest==0) {
    if($i>=2) {
      $greatest=1;
    } else {
      return '';
    }  
  }
  return join('.', reverse((@labels)[0 .. $greatest]));
}

sub get_DMARC_record {
  my ($host,$prefix)=@_;
  $prefix='' unless($prefix);
  my $query = $DNS_res->send($prefix."_dmarc.$host", 'TXT');
  if($query) {
    foreach($query->answer) {
      next if $_->type ne 'TXT';
      my $data=$_->txtdata;
      return $data if($data=~/^v\s*=\s*DMARC1/); #skip records which don't start with v=DMARC
    }
  }
  undef;
}

sub get_public_suffix_list {
  if(0) { # either read one form file or getch from Internet
  
    my $fileName="effective_tld_names.txt";
    open(FILE,$fileName) || die "Can't open $fileName: $!\n";
    $publicSuffixList.=$_ while(<FILE>);
    close(FILE);

  } else {
    require LWP::UserAgent;
    require HTTP::Request;

    my $url='http://mxr.mozilla.org/mozilla-central/source/netwerk/dns/effective_tld_names.dat?raw=1';
    my $ua  = LWP::UserAgent->new;
    # $ua->proxy(['http', 'ftp'], $ProxyURL) if($ProxyURL);
    my $req = HTTP::Request->new('GET',$url);
    my $res = $ua->request($req);
  
    if($res->code != 200) {
      die "Error: " . $res->code . " " . $res->message;
    }
    $publicSuffixList=$res->content();
  
  }
  $publicSuffixList =~s|^//.*||mg; #remove comments
  $publicSuffixList =~s|\n{2,}|\n|g; #remove empty lines

}

my %fileCache;
my $reportCnt=0;

sub processReports {
  $SIG{TERM}= sub {
     print "* reports daemon stopped\n";
     exit(0); 
  };
    
  print "* reports daemon started\n";
  while(1) {
    opendir(my $dh, $reportsDir) || die "can't opendir $reportsDir: $!";
    my @filelist = grep { /\.data$/ && -f "$reportsDir/$_" } readdir($dh);
    closedir $dh;
    
    foreach my $fName (@filelist) {
      processReportFile($fName);
    }
    sleep(60);
  }
}

sub processReportFile {
  my ($fName)=@_;
  my ($vers,$dmarcDomain,$reportStartTime,$reportEndTime,$policy,$recipients);
  #print "* processing $fName\n";
  unless($fileCache{$fName}) {
    open(FILE,"$reportsDir/$fName");
    my $line=<FILE>;
    close(FILE);
    ($vers,$dmarcDomain,$reportStartTime,$reportEndTime,$policy,$recipients)=split(/;/,$line);
    $fileCache{$fName}=$reportEndTime;
  }
  
  if($fileCache{$fName} < time()) { # it's time to send the report
    $fName=~/(.*)\.data$/;
    print "* composing report for $1\n";
    my %reportData;
    
    if(open(LOCK_FILE,">$lockName")) {
      flock(LOCK_FILE, 2 ); # exclusive
      if(open(FILE,"$reportsDir/$fName")) {
        flock(FILE, 2 ); # exclusive
        my $line=<FILE>;
        chomp($line);
        ($vers,$dmarcDomain,$reportStartTime,$reportEndTime,$policy,$recipients)=split(/;/,$line);
        if($vers==1) {
          while($line=<FILE>) {
            chomp($line);
            if($reportData{$line}) {
              $reportData{$line}++;
            } else {
              $reportData{$line}=1;
            }
          }
        }
        delete $fileCache{$fName};
        close(FILE);
        unlink("$reportsDir/$fName");
      }  
      close(LOCK_FILE);
    }
    if(keys %reportData) { # have something to report
      $reportEndTime=time();
      my $reportFileName="$reportDomain!$dmarcDomain!$reportStartTime!$reportEndTime";

      unless(open(XML_FILE,">$reportsDir/$reportFileName.xml")) {
        print "* can't create $reportsDir/$reportFileName.xml: $!\n";
        return;
      }
      my $reportID=int(rand(10000)).":".time()."\@$reportDomain";
my $reportH1=<<EOT;
<?xml version="1.0" encoding="UTF-8" ?>
<feedback>
  <report_metadata>
    <org_name>$reportOrg</org_name>
    <email>$reportEmail</email>
    <report_id>$reportID</report_id>
    <date_range>
      <begin>$reportStartTime</begin>
      <end>$reportEndTime</end>
    </date_range>
  </report_metadata>
  <policy_published>
    <domain>$dmarcDomain</domain>
EOT

      print XML_FILE $reportH1;
      my %hPolicy=map { /^(.*?)=(.*)$/ } split /,/, $policy;
      my $v;
      
      $v=$hPolicy{adkim} || 'r'; print XML_FILE "    <adkim>$v</adkim>\n"; 
      $v=$hPolicy{aspf} || 'r';  print XML_FILE "    <aspf>$v</aspf>\n";  
      $v=$hPolicy{p} || 'none';  print XML_FILE "    <p>$v</p>\n"; 
      $v=$hPolicy{sp} || 'none'; print XML_FILE "    <sp>$v</sp>\n"; 
      $v=$hPolicy{pct} || '100'; print XML_FILE "    <pct>$v</pct>\n"; 
      print XML_FILE "  </policy_published>\n";
      
      foreach(keys %reportData) {
        my $count=$reportData{$_};
        my ($sourceIP,$disposition,$dkimResult,$spfResult,$envelopeTo,$fromDomain,$dkimDomain,$dkimResult2,$dkimHumanResult,$spfDomain,$spfResult2)=split(";",$_);
my $reportH2=<<EOT;
  <record>
    <row>
      <source_ip>$sourceIP</source_ip>
      <count>$count</count>
      <policy_evaluated>
        <disposition>$disposition</disposition>
        <dkim>$dkimResult</dkim>
        <spf>$spfResult</spf>
      </policy_evaluated>
    </row>
    <identifiers>
      <envelope_to>$envelopeTo</envelope_to>
      <header_from>$fromDomain</header_from>
    </identifiers>
    <auth_results>
      <dkim>
        <domain>$dkimDomain</domain>
        <result>$dkimResult2</result>
        <human_result>$dkimHumanResult</human_result>
      </dkim>
      <spf>
        <domain>$spfDomain</domain>
        <result>$spfResult2</result>
      </spf>
    </auth_results>
  </record>
EOT
         print XML_FILE $reportH2;
      }
      print XML_FILE "</feedback>\n";
      close(XML_FILE);
      
      
      my $zip = Archive::Zip->new();
      my $file_member = $zip->addFile( "$reportsDir/$reportFileName.xml", "$reportFileName.xml" );
      $file_member->desiredCompressionLevel( COMPRESSION_LEVEL_BEST_COMPRESSION );
   
      # Save the Zip file
      my $zipResult=$zip->writeToFileNamed("$reportsDir/$reportFileName.zip");
      unlink("$reportsDir/$reportFileName.xml");
      
      unless ( $zipResult == AZ_OK ) {
        print "* unable to compress ZIP file\n";
        return;
      }

      unless(open(FILE,"$reportsDir/$reportFileName.zip")) {
        print "* can't open $reportsDir/$reportFileName.zip: $!\n";
        return;
      }
      unless(binmode(FILE)) {
        print "* can't switch $reportsDir/$reportFileName.zip to binmode: $!\n";
        return;
      }
      my $base64data="";
      while (read(FILE, my $buf, 60*57)) {
        $base64data.=encode_base64($buf);
      }
      close(FILE);
      
      unlink("$reportsDir/$reportFileName.zip");
      
      my @recipients1= split(/,/,$recipients);
      my @recipients2;
      foreach(@recipients1) {
        if(/(.*)!(\d+)(.)/) {
          my ($rcpt,$limit)=($1,$2);
          $limit*=1024 if($3=~/k/i);
          $limit*=1024*1024 if($3=~/m/i);
          $limit*=1024*1024*1024 if($3=~/g/i);
          $limit*=1024*1024*1024*1024 if($3=~/t/i);
          if($limit > length($base64data) + 1024) { 
            push(@recipients2,$rcpt);
          } else {
            print "* the data is too large for $_\n";
          } 
        } else {
          push(@recipients2,$_);
        }
      }
      unless(@recipients2) {
        print "* no recipients for the report to $dmarcDomain\n";
        return;
      }
      my $recipients3=join(",",@recipients2);
      my $boundary="===_".$reportID;
my $reportH3=<<EOT;
From: $reportEmail
To: $recipients3
Message-ID: <$reportID>
Subject: Report Domain: $dmarcDomain Submitter: $reportDomain Report-ID: $reportID
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="$boundary"

This is a multipart message in MIME format.

--$boundary
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is an aggregate report from $reportOrg.

--$boundary
Content-Type: application/zip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="$reportFileName.zip"

EOT
              
      my $subFName="$SubmittedDir/DMARC-report-$$-".++$reportCnt;        
      unless(open(FILE,">$subFName.tmp")) {
        print "* can't create $subFName.tmp: $!\n";
        return;
      }
      print FILE $reportH3;
      print FILE $base64data;
      print FILE "\n--$boundary--\n";
      close(FILE);
      rename("$subFName.tmp","$subFName.sub");
    }#have something to report
  }  

}

__END__


