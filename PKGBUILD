# $Id$
# Maintainer: Franziskus Kiefer <franziskuskiefer@gmail.com>

_pkgname=nspr
pkgname=nspr-hg
# TODO: read version from source
pkgver=4.26
pkgrel=1
pkgdesc="Netscape Portable Runtime"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSPR"
arch=(x86_64)
license=(MPL GPL)
depends=(glibc sh)
makedepends=(zip)
source=("hg+https://hg.mozilla.org/projects/nspr")
sha256sums=('SKIP')
conflicts=('nspr')
provides=("nspr=${pkgver}")

prepare() {
  cd $_pkgname
}

build() {
  cd $_pkgname
  tag=$(hg id https://hg.mozilla.org/projects/nspr#default)
  hg up $tag
  ./configure \
      --prefix=/usr \
      --libdir=/usr/lib \
      --includedir=/usr/include/nspr \
      --enable-optimize \
      --disable-debug \
      $([[ $CARCH == x86_64 ]] && echo --enable-64bit)
  make ${SOURCE_DATE_EPOCH:+
    SH_NOW="${SOURCE_DATE_EPOCH}000000"
    SH_DATE="$(date --utc --date="@$SOURCE_DATE_EPOCH" '+%Y-%m-%d %T')"
  }
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  ln -s nspr.pc "$pkgdir/usr/lib/pkgconfig/mozilla-nspr.pc"
  rm -r "$pkgdir"/usr/bin/{compile-et.pl,prerr.properties} \
        "$pkgdir"/usr/include/nspr/md
}

