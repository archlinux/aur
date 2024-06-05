# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libpng-git
pkgver=1.6.43.r1.gf1848a3b5
pkgrel=1
pkgdesc="The official PNG reference library"
arch=('i686' 'x86_64')
url="http://www.libpng.org/pub/png/libpng.html"
license=('libpng-2.0')
depends=('glibc' 'zlib' 'sh')
makedepends=('git')
provides=("libpng=$pkgver" 'libpng16.so')
conflicts=('libpng')
options=('staticlibs')
source=("git+https://git.code.sf.net/p/libpng/code")
sha256sums=('SKIP')


pkgver() {
  cd "code"

  git describe --long --tags | sed 's/^libpng-//;s/^v//;s/-master//;s/-signed//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "code"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  ./configure \
    --prefix="/usr"
  make

  cd "contrib/pngminus"
  make \
    CFLAGS="$CFLAGS" \
    LDFLAGS="$LDFLAGS" \
    PNGLIB_SHARED="-L$pkgdir/usr/lib -lpng" \
    png2pnm \
    pnm2png
}

check() {
  cd "code"

  #make check
}

package() {
  cd "code"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libpng"

  install -Dm755 contrib/pngminus/{png2pnm,pnm2png} -t "$pkgdir/usr/bin"
}
