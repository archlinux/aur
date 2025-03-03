# Maintainer: Wouter Eerdekens <retuow at protonmail dot ch>

# This PKGBUILD was pulled from the flac1.3 aur package.

pkgname=flac1.4
pkgver=1.4.3
pkgrel=2
pkgdesc='Free Lossless Audio Codec (compat libs for v12)'
url='https://xiph.org/flac/'
arch=('x86_64')
license=('BSD' 'GPL')
provides=('libFLAC.so.12')
depends=('gcc-libs' 'libogg')
makedepends=('nasm' 'cmake' 'ninja')
source=(https://downloads.xiph.org/releases/flac/flac-${pkgver}.tar.xz)
sha256sums=('6c58e69cd22348f441b861092b825e591d0b822e106de6eb0ee4d05d27205b70')

prepare() {
  cd flac-${pkgver}
}

build() {
  cmake -S flac-${pkgver} -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
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

  rm -rf "${pkgdir}"/usr/{include,lib/{libFLAC++.so,libFLAC.so},share}


  install -Dm 644 flac-${pkgver}/COPYING.Xiph -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
