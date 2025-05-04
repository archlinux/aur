pkgname=slint-cpp
_pkgname=slint
pkgver=1.11.0
pkgrel=1
pkgdesc="Declarative GUI toolkit to build native user interfaces for Rust, C++, or JavaScript apps"
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64')
url="https://github.com/slint-ui/slint/"
depends=('freetype2' 'libglvnd' 'libx11' 'mesa' 'wayland')
makedepends=('cmake>=3.21' 'rust>=1.82')
options=('strip')
source=("https://github.com/${_pkgname}-ui/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        disable-jemalloc.patch)
sha256sums=('14f11235bf6c2eb02c718f5eb915393b7775a92d083abcefe654acf8bc823cab'
            '108901131ae5b76ae8fa0fe7676d3904c351553eb35d6fe548721459e5ee97f3')

prepare () {
  cd ${_pkgname}-${pkgver}

  patch -Np1 -i "${srcdir}"/disable-jemalloc.patch

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
  install -m755 libslint_cpp.so libslint_cpp.so.${pkgver}
  rm libslint_cpp.so
  ln -s libslint_cpp.so.${pkgver} libslint_cpp.so
  ln -s libslint_cpp.so.${pkgver} libslint_cpp.so.1
}
