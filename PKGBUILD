# Maintainer: Tom Zander
# Past major contributors: Christoph Vigano <mail@cvigano.de>
pkgname=ikiwiki
pkgver=3.20170111
pkgrel=1
pkgdesc="wiki/blog compiler"
arch=(any)
license=('GPL')
url="http://ikiwiki.info"
depends=(perl-yaml perl-text-markdown perl-cgi-session perl-cgi-formbuilder perl-timedate perl-html-parser perl-html-scrubber perl-mail-sendmail perl-time-duration perl-uri perl-html-template perl-locale-gettext perl-rpc-xml perl-yaml-libyaml)
source=("http://deb.debian.org/debian/pool/main/i/${pkgname}/${pkgname}_${pkgver}.tar.xz")
backup=("etc/ikiwiki/wikilist")
sha256sums=('5f0f99a4f4a5f17046e4601d628424cb2877766b4ef9bfe1c2db1941f6f7a701')

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
