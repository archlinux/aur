# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=horde3d
pkgver=2.0.2
pkgrel=1
pkgdesc='Horde3D is a small 3D rendering and animation engine. It is written in an effort to create an engine being as lightweight and conceptually clean as possible.'
url='http://www.horde3d.org/'
license=('EPL')
arch=('i686' 'x86_64')
depends=('libgl' 'glfw-x11')
makedepends=('cmake' 'ninja')
source=("https://github.com/horde3d/Horde3D/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('aa920e4dedbbc9a105fea77848ca0053ee99df50ae2d259268300840eec8516fd005ba7f8595c3405db63c09598ecd261e124a24232585ad190c8fd789086d9d')

prepare() {
  cd "${srcdir}/Horde3D-${pkgver}"
}

build() {
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"

  cmake \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_C_FLAGS="${CFLAGS/-O2/-Ofast}" \
    -D CMAKE_CXX_FLAGS="${CXXFLAGS/-O2/-Ofast}" \
    ../Horde3D-${pkgver}

  ninja
}

package() {
  cd "${srcdir}/build"
  DESTDIR="${pkgdir}" ninja install

  install -Dm755 "${srcdir}/build/Binaries/Linux/Release/ColladaConv" "${pkgdir}"/usr/bin/ColladaConv
}
