# Maintainer: Attila Greguss <floyd0122@gmail.com>

# This PKGBUILD was pulled from multilib repo as is.

# Original maintainers:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: David Roth <davidroth9@gmail.com>

pkgname=lib32-flac1.3
pkgver=1.3.4
pkgrel=1
pkgdesc='Free Lossless Audio Codec (32-bit) (compat libs for v8)'
url='https://xiph.org/flac/'
arch=('x86_64')
license=('BSD' 'GPL')
depends=('lib32-gcc-libs' 'lib32-libogg' 'flac1.3')
makedepends=('nasm' 'cmake' 'ninja')
source=(https://downloads.xiph.org/releases/flac/flac-${pkgver}.tar.xz)
sha512sums=('4a626e8a1bd126e234c0e5061e3b46f3a27c2065fdfa228fd8cf00d3c7fa2c05fafb5cec36acce7bfce4914bfd7db0b2a27ee15decf2d8c4caad630f62d44ec9')

prepare() {
  cd flac-${pkgver}
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -S flac-${pkgver} -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib32 \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_PROGRAMS=OFF \
    -DBUILD_DOCS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALL_CMAKE_CONFIG_MODULE=OFF \
    -DINSTALL_PKGCONFIG_MODULES=OFF \
    -DINSTALL_MANPAGES=OFF \
    -DBUILD_SHARED_LIBS=ON \
    -DWITH_STACK_PROTECTOR=OFF \
    -DNDEBUG=ON
  cmake --build build
}

package() {

  DESTDIR="${pkgdir}" cmake --install build

  rm -rf "${pkgdir}"/usr/{include,lib32/{libFLAC++.so,libFLAC.so},share}


  install -Dm 644 flac-${pkgver}/COPYING.Xiph -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
