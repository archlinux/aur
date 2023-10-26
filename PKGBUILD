# Maintainer: belst <aur at bel dot st>
_pkgbasename=minizip
pkgname=lib32-minizip
pkgver=1.3
pkgrel=2
pkgdesc="ZIP file extraction library (32-bit)"
url="http://www.winimage.com/zLibDll/minizip.html"
license=('ZLIB' 'custom')
arch=('x86_64')
makedepends=('gcc-multilib' 'lib32-gcc-libs' 'libtool-multilib')
options=(!libtool)
depends=('lib32-glibc' "$_pkgbasename" 'lib32-zlib')
source=("http://zlib.net/zlib-${pkgver}.tar.gz")
sha256sums=('ff0ba4c292013dbc27530b3a81e1f9a813cd39de01ca5e0f8bf355702efa593e')

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
