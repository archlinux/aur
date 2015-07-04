# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=(zlib-asm)
pkgver=1.2.8
pkgrel=1
pkgdesc='Compression library implementing the deflate compression method found in gzip and PKZIP'
arch=('i686' 'x86_64')
license=('custom')
url="http://www.zlib.net/"
depends=('glibc')
provides=("zlib=$pkgver")
conflicts=('zlib')
source=("http://zlib.net/current/zlib-$pkgver.tar.gz")
md5sums=('44d667c142d7cda120332623eab69f40')

build() {
  cd "zlib-$pkgver"

  # use ASM optimizations
  case $CARCH in
    x86_64)
      cp contrib/gcc_gvmat64/gvmat64.S ./match.S
      ;;
    i686)
      cp contrib/asm686/match.S ./match.S
      ;;
  esac

  CFLAGS+=' -O3 -DASMV'

  ./configure --prefix=/usr
  make OBJA=match.o PIC_OBJA=match.lo

  sed '/\*\//q' zlib.h > LICENSE
}

check() {
  make -C zlib-$pkgver test
}

package() {
  cd "zlib-$pkgver"

  make install "DESTDIR=$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/zlib/LICENSE"
}
