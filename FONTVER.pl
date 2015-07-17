#!/usr/bin/perl

# Extract: Version 0.00 Font Name Bold
use warnings;
#http://www.perlmonks.org/bare/?node_id=224506
use strict;
use Font::TTF::Font;
#use CGI qw(:all);

#print header();
my $rv=1;
if ( $#ARGV >= 0 ) { 
  my $f = $ARGV[0];
  my $fontname = Font::TTF::Font->open($f);
  if (ref $fontname) {
    my $fnar;
    if ($fnar = $fontname->{name}) {
      my $fr=$fnar->read;
# http://www.microsoft.com/typography/otspec/name.htm Name IDs
      print $fr->find_name(5)." ".$fr->find_name(4);
      $rv=0;
    }
    $fontname->release();
  }
} else {
  print "Usage: $0 foo.ttf\n";
  print "Result: Version 1.05 Foo Narrow Bold Italic\n";
}
exit($rv);
