# Maintainer: Christoph Vigano <mail@cvigano.de>
pkgname=ikiwiki
pkgver=3.20160509
pkgrel=1
pkgdesc="wiki/blog compiler"
arch=(any)
license=('GPL')
url="http://ikiwiki.info"
depends=(perl-yaml perl-text-markdown perl-cgi-session perl-cgi-formbuilder perl-timedate perl-html-parser perl-html-scrubber perl-mail-sendmail perl-time-duration perl-uri perl-html-template perl-locale-gettext perl-rpc-xml perl-yaml-libyaml)
source=("http://ftp.de.debian.org/debian/pool/main/i/${pkgname}/${pkgname}_${pkgver}.tar.gz")
backup=("etc/ikiwiki/wikilist")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install module into the vendor directories
  sed -i -e 's/sbin/bin/g' Makefile.PL

  perl Makefile.PL PREFIX="/usr" INSTALL_BASE= INSTALLDIRS=vendor
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install DESTDIR="$pkgdir"

  # otherwise perl breaks
  find "$pkgdir" -name '.packlist' -or -name '*.pod' -exec rm '{}' +

  #RST plugin docutils hack
  sed -i 's/env python/python2/' "$pkgdir"/usr/lib/ikiwiki/plugins/rst
}
md5sums=('22fe66e77d6062ddf68ef5e9ec184dc0')
