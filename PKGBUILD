# Maintainer: belst <aur at bel dot st>
_pkgbasename=minizip
pkgname=lib32-minizip
pkgver=1.2.12
pkgrel=1
pkgdesc="ZIP file extraction library (32-bit)"
url="http://www.winimage.com/zLibDll/minizip.html"
license=('ZLIB' 'custom')
arch=('x86_64')
makedepends=('gcc-multilib' 'libtool-multilib')
options=(!libtool)
depends=('lib32-glibc' "$_pkgbasename" 'lib32-zlib')
source=("http://zlib.net/zlib-${pkgver}.tar.gz")
sha256sums=('91844808532e5ce316b3c010929493c0244f3d37593afd6de04f71821d5136d9')

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
