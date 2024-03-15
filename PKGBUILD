pkgname=slint-cpp
_pkgname=slint
pkgver=1.5.0
pkgrel=1
pkgdesc="Declarative GUI toolkit to build native user interfaces for Rust, C++, or JavaScript apps"
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64')
url="https://github.com/slint-ui/slint/"
depends=('freetype2' 'libglvnd' 'libx11' 'mesa' 'wayland')
makedepends=('cmake>=3.21' 'rust>=1.70')
options=('strip')
source=("https://github.com/${_pkgname}-ui/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0f89a4fdb5f8f855123114ab1a7dd2b815f42b907134a93d6bfda45f7f2d55eb')

prepare () {
  cd ${_pkgname}-${pkgver}
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DSLINT_FEATURE_BACKEND_QT=No \
    -DSLINT_FEATURE_RENDERER_SKIA_OPENGL=Yes \
    -DSLINT_FEATURE_RENDERER_SKIA_VULKAN=Yes \
    -DSLINT_FEATURE_RENDERER_SOFTWARE=Yes \
    -B.MinSizeRel .
}

build() {
  cd ${_pkgname}-${pkgver}/.MinSizeRel
  make
}

package() {
  cd ${_pkgname}-${pkgver}/.MinSizeRel
  make DESTDIR=${pkgdir} install
  cd ${pkgdir}/usr/lib
  install -m755 libslint_cpp.so libslint_cpp.so.1.5.0
  rm libslint_cpp.so
  ln -s libslint_cpp.so.1.5.0 libslint_cpp.so
  ln -s libslint_cpp.so.1.5.0 libslint_cpp.so.1
}
