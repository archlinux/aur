# Maintainer: Allan McRae <allan@archlinux.org>
# Contributer: Jason Chu <jchu@xentac.net>

_pkgbasename=openal
pkgname=lib32-$_pkgbasename
pkgver=1.12.854
pkgrel=3
pkgdesc="OpenAL audio library for use with opengl (32-bit)"
arch=('x86_64')
url="http://www.openal.org/"
license=('LGPL')
depends=('lib32-glibc' $_pkgbasename)
makedepends=('lib32-alsa-lib' 'lib32-sdl' 'pkgconfig' 'cmake' gcc-multilib)
options=('!libtool')
source=(http://kcat.strangesoft.net/openal-releases/openal-soft-${pkgver}.tar.bz2)
md5sums=('fbf36451fdebd6466edbdc0ee7db9603')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd ${srcdir}/${_pkgbasename}-soft-${pkgver}/build
  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE=Release -D LIB_INSTALL_DIR=/usr/lib32 ..
  make
}

package() {
  cd ${srcdir}/${_pkgbasename}-soft-${pkgver}/build
  make DESTDIR=${pkgdir}/ install 

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}
