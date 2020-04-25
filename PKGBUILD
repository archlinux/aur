# Maintainer: Jiří Klimeš <blueowl@centrum.cz>
# Submitter: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: K. Hampf <k.hampf@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=xmltv
pkgver=0.6.1
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
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/XMLTV/${pkgname}/archive/v${pkgver}.tar.gz"
  https://github.com/XMLTV/xmltv/commit/9fd054bc5825da55b6bc45c8bedd23076115e081.patch
)
sha256sums=('02968d596040f43244fbff7b08618a38247a086e94f5e4e55f113f44d9b04353'
            '678b37bb86fbf1f19da171481204edac1293d38775dd115a04154964746b137d')

prepare(){
  # patch for fixing an error after XML::Parser change
  # see upstream https://github.com/XMLTV/xmltv/commit/9fd054bc5825da55b6bc45c8bedd23076115e081
  # the change in XML::Parser is this: https://github.com/toddr/XML-Parser/commit/5ccabfc66adfb79ed75dc5bb2101d30f62d34706
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir"/9fd054bc5825da55b6bc45c8bedd23076115e081.patch
}

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
