# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Franziskus Kiefer <franziskuskiefer@gmail.com>

_pkgname=nspr
pkgname=nspr-hg
pkgver=4.35.r4.g3e25d69ba6b2
pkgrel=1
pkgdesc="Netscape Portable Runtime"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSPR"
arch=(x86_64)
license=(MPL GPL)
depends=(glibc sh)
makedepends=(mercurial zip)
source=("hg+https://hg.mozilla.org/projects/nspr")
sha256sums=('SKIP')
conflicts=('nspr')
provides=("nspr=${pkgver%.r*}")

pkgver() {
  cd $_pkgname
  hg log -r . --template '{latesttag}.r{latesttagdistance}.g{node|short}\n' \
    | sed 's/^[a-zA-Z_]*//;s/_RTM//;s/_\([a-zA-Z][a-zA-Z0-9]\+\)/\1/;s/_/./g' \
    | tr '[:upper:]' '[:lower:]'
}

prepare() {
  cd $_pkgname
  ./configure \
      --prefix=/usr \
      --libdir=/usr/lib \
      --includedir=/usr/include/nspr \
      --enable-optimize \
      --disable-debug \
      --enable-64bit
}

build() {
  cd $_pkgname
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

