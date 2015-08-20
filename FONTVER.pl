#!/usr/bin/perl

# Extract from ttf: Version 0.00 Font Name Bold
# Extract from ttc: Version 0.00 Batang; Batang Bold(0.01)
# This program is slow
use warnings;
#http://www.perlmonks.org/bare/?node_id=224506
use strict;
use Font::TTF::Font;
use Font::TTF::Ttc;

my $rv=1;
if ( $#ARGV >= 0 ) {
  my $f = $ARGV[0];
  my $ttc = Font::TTF::Ttc->open($f); # hash ref
  if (ref $ttc) {
    my $firstsp=''; # Version 0.00 or '; '
    my $firstvershort=''; # 0.00 or blank if same as first
    my $langs='x';
    my $ttf;
    foreach $ttf (@{$ttc->{directs}}) {
      my $fnar;
      if ($fnar = $ttf->{name}) {
        my $fr=$fnar->read();
        my $verlong=$fr->find_name(5);
        $firstsp=$verlong.' ' if (length($firstsp)==0);
        my $vershort=$verlong;
        if ($verlong =~ m/Version ([0-9\.]+)/ ) {
          $vershort=$1;
        }
        $firstvershort=$vershort if (length($firstvershort)==0);
        if ($vershort eq $firstvershort) {
          $vershort='';
        } else {
          $vershort='('.$vershort.')'; # Show (version) on each font if different
        }
        my @neid=$fr->find_name(4);
        if (length($langs) != 0) {
             $langs='';
          my $langsfirst='';
          foreach (keys %{$fnar->{'strings'}[5][3][1]}) {
            if ($_ != 0x409) {
              $langs .= $langsfirst.$fnar->get_lang($neid[1], $_);
              $langsfirst=',';
            }
          }
          $langs=$fnar->get_lang($neid[1],0x409) if (length($langs)==0);
          $langs .= ' ';
        }
        print $langs.$firstsp.$neid[0].$vershort;
        $firstsp='; ';
        $langs='';
        $rv=0;
      }
    }
    print "\n" if ($rv eq 0);
    $ttc->DESTROY();
  } else {
    my $ttf = Font::TTF::Font->open($f);
    if (ref $ttf) {
      my $fnar;
      if ($fnar = $ttf->{name}) {
        my $fr=$fnar->read();
        #for(my $test=0; $test<200; $test++) { my @testar=$fr->find_name($test); print STDERR $test,",",$testar[3],'-',$testar[0],"\n"; }
        #foreach ($fr) { print STDERR $_[3],'-',$_[0],"\n"; }
# http://www.microsoft.com/typography/otspec/name.htm Name IDs
        my @neid=$fr->find_name(4);

        #foreach (keys %{$fnar->{'strings'}[5][3][1]}) { printf STDERR "lang=%04X %s\n",$_,$fnar->get_lang($neid[1], $_); }
        my $langs='';
        my $langsfirst='';
        foreach (keys %{$fnar->{'strings'}[5][3][1]}) {
          if ($_ != 0x409) {
            $langs .= $langsfirst.$fnar->get_lang($neid[1], $_);
            $langsfirst=',';
          }
        }
        $langs=$fnar->get_lang($neid[1],0x409) if (length($langs)==0);

        print $langs.' '.$fr->find_name(5)." ".$neid[0],"\n";
        $rv=0;
      }
      $ttf->release();
    }
  }
} else {
  print "Usage: $0 foo.tt[fc]\n";
  print "Result: Version 1.05 Foo Narrow Bold Italic FB ITC\n";
}
exit($rv);
