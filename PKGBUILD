# Maintainer: Kåre Hampf <khampf@users.sourceforge.net>
# Submitter: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=xmltv
pkgver=0.5.66
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
  'perl-xml-treepp')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2"
disable-unicode-string.patch)
md5sums=('1ad51ff5a02e8320bd908c7908c49661'
         '2a55fecd366f27373633fdc02f6be237')

prepare() {
  echo "NOTE: Disabling recommended but optional Unicode::String"
  echo "      (due to SIGSEGV in build process)"
  cd "$pkgname-$pkgver"
  patch -p0 -i $srcdir/disable-unicode-string.patch
}

build() {
  cd "$pkgname-$pkgver"
  yes | perl Makefile.PL PREFIX=/usr INSTALLDIRS=vendor 

  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
	 
  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
