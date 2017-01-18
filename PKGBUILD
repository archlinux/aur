# Maintainer: belst <aur at bel dot st>
_pkgbasename=minizip
pkgname=lib32-minizip
pkgver=1.2.11
pkgrel=1
pkgdesc="ZIP file extraction library (32-bit)"
url="http://www.winimage.com/zLibDll/minizip.html"
license=('ZLIB' 'custom')
arch=('x86_64')
makedepends=('gcc-multilib' 'libtool-multilib')
options=(!libtool)
depends=('lib32-glibc' "$_pkgbasename" 'lib32-zlib')
source=("http://zlib.net/zlib-${pkgver}.tar.gz")
sha256sums=('c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1')

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd $srcdir/zlib-$pkgver/contrib/$_pkgbasename
  rm Makefile
  autoreconf -i
  autoconf
  automake --add-missing
  automake
  ./configure --prefix=/usr --libdir=/usr/lib32

  make
}

package() {
  cd $srcdir/zlib-$pkgver/contrib/$_pkgbasename
  make install DESTDIR=${pkgdir}

  rm -rf $pkgdir/usr/{include,share}
  install -d $pkgdir/usr/share/licenses
  ln -s $_pkgbasename $pkgdir/usr/share/licenses/$pkgname
}
