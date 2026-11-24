# Maintainer: belst <aur at bel dot st>
_pkgbasename=minizip
pkgname=lib32-minizip
pkgver=1.4
pkgrel=1
pkgdesc="ZIP file extraction library (32-bit)"
url="http://www.winimage.com/zLibDll/minizip.html"
license=('ZLIB' 'custom')
arch=('x86_64')
makedepends=('gcc-multilib' 'lib32-gcc-libs' 'libtool-multilib')
options=(!libtool)
depends=('lib32-glibc' "$_pkgbasename" 'lib32-zlib')
source=(https://github.com/madler/zlib/releases/download/v$pkgver/zlib-$pkgver.tar.xz)
sha512sums=('c6701ef216f2ea451056466794c520df62af0a7ddf57c907c3263678dc625f3d6466e0187106dec0d7721ad6fc6cf105e0f93a4cac82fbcc2ba919eebd29c0b0')
validpgpkeys=('5ED46A6721D365587791E2AA783FCD8E58BCAFBA') # Mark Adler <madler@alumni.caltech.edu>

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
