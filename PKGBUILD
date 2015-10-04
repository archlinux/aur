pkgname=stsoundlibrary-git
pkgver=0.3.0.r36.gd6e5adb
pkgrel=1
pkgdesc='Library for AY-3-8912 chip emulation and YM music files (libstsound)'
arch=(i686 x86_64)
url='https://github.com/cpcsdk/cpctools/tree/master/libstsound'
license=(BSD)
depends=(glibc gcc-libs)
makedepends=(git)
source=('cpctools::git+https://github.com/cpcsdk/cpctools')
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir"/cpctools
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed -r 's/^cpctools-//;s/([^-]*-g)/r\1/;y/-/./' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir"/cpctools/libstsound
  ./build_config.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/cpctools/libstsound
  make DESTDIR="$pkgdir" install
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}
