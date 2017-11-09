# Maintainer: Tom Zander
# Past major contributors: Christoph Vigano <mail@cvigano.de>
pkgname=ikiwiki
pkgver=3.20171001
pkgrel=1
pkgdesc="wiki/blog compiler"
arch=(any)
license=('GPL')
url="http://ikiwiki.info"
depends=(perl-yaml perl-text-markdown perl-cgi-session perl-cgi-formbuilder perl-timedate perl-html-parser perl-html-scrubber perl-mail-sendmail perl-time-duration perl-uri perl-html-template perl-locale-gettext perl-rpc-xml perl-yaml-libyaml)
source=("http://deb.debian.org/debian/pool/main/i/${pkgname}/${pkgname}_${pkgver}.tar.xz")
backup=("etc/ikiwiki/wikilist")
sha256sums=('a3bdeaf2f129d38ae6ee55c73deaed40623e05ccfb5f692bde8a6c7b4e021966')

build() {
  cd "$pkgname-$pkgver"

  # Install module into the vendor directories
  sed -i -e 's/sbin/bin/g' Makefile.PL

  perl Makefile.PL PREFIX="/usr" INSTALL_BASE= INSTALLDIRS=vendor
  make PREFIX="/usr"
}

package() {
  cd "$pkgname-$pkgver"

  make install DESTDIR="$pkgdir"

  # otherwise perl breaks
  find "$pkgdir" -name '.packlist' -or -name '*.pod' -exec rm '{}' +

  #RST plugin docutils hack
  sed -i 's/env python/python2/' "$pkgdir"/usr/lib/ikiwiki/plugins/rst
}
