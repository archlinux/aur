# Maintainer: Tom Zander
# Past major contributors: Christoph Vigano <mail@cvigano.de>
pkgname=ikiwiki
pkgver=3.20180105
pkgrel=1
pkgdesc="wiki/blog compiler"
arch=(any)
license=('GPL')
url="http://ikiwiki.info"
depends=(perl-yaml perl-text-markdown perl-cgi-session perl-cgi-formbuilder perl-timedate perl-html-parser perl-html-scrubber perl-mail-sendmail perl-time-duration perl-uri perl-html-template perl-locale-gettext perl-rpc-xml perl-yaml-libyaml)
source=("http://http.debian.net/debian/pool/main/i/${pkgname}/${pkgname}_${pkgver}.orig.tar.xz")
backup=("etc/ikiwiki/wikilist")
sha256sums=('f9c00a7453566f3737cd43dc1835bf6a17989d74cbce62bffa1adcc6ea3f09e9')

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
