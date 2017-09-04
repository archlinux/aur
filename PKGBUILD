# Maintainer: K. Hampf <k.hampf@gmail.com>
# Submitter: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>
# Contributor: "blueowl" <blueowl@centrum.cz>

pkgname=xmltv
pkgver=0.5.69
pkgrel=2
pkgdesc="Set of utilities to download tv listings and format them in xml"
arch=('any')
url="http://xmltv.org/wiki/"
license=('GPL')
depends=('perl-archive-zip' 'perl-datetime' 'perl-date-manip' 
  'perl-file-slurp' 'perl-datetime-format-strptime' 'perl-datetime-locale' 
  'perl-http-cache-transparent' 'perl-http-response-encoding' 
  'perl-html-tree' 'perl-io-stringy' 'perl-lingua-en-numbers-ordinate' 
  'perl-lingua-preferred' 'perl-soap-lite' 'perl-term-progressbar'
  'perl-term-readkey' 'perl-timedate' 'perl-tk-tablematrix' 
  'perl-unicode-string' 'perl-unicode-utf8simple' 'perl-www-mechanize'
  'perl-xml-dom' 'perl-xml-libxml' 'perl-xml-libxslt' 'perl-xml-simple'
  'perl-xml-twig' 'perl-xml-writer' 'perl-parse-recdescent' 'perl-cgi'
  'perl-xml-treepp' 'perl-datetime-format-iso8601' 'perl-json')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('1b0128f97755e7769177d7930e03ad74')

build() {
  cd "$pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  yes | /usr/bin/perl Makefile.PL PREFIX=/usr INSTALLDIRS=vendor 
  make
}

check() {
  cd "$pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install DESTDIR="$pkgdir"
	 
  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}

prepare() {
  # To build corectly with Perl 5.26
  # see https://sourceforge.net/p/xmltv/mailman/message/36001436/
  # and https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=865045
  sed "s/use POSIX 'tmpnam';//" -i "$pkgname-$pkgver"/filter/tv_to_latex
  sed "s/use POSIX 'tmpnam';//" -i "$pkgname-$pkgver"/filter/tv_to_text
  sed "s/\(lib\/set_share_dir.pl';\)/.\/\1/" -i "$pkgname-$pkgver"/grab/it/tv_grab_it.PL
  sed "s/\(filter\/Grep.pm';\)/.\/\1/" -i "$pkgname-$pkgver"/filter/tv_grep.PL
  sed "s/\(lib\/XMLTV.pm.in';\)/.\/\1/" -i "$pkgname-$pkgver"/lib/XMLTV.pm.PL
  sed "s/\(lib\/Ask\/Term.pm';\)/.\/\1/" -i "$pkgname-$pkgver"/Makefile.PL
}
