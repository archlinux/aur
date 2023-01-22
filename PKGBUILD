# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=combolution3d
pkgname=avisynth-plugin-${_plug}-git
pkgver=1.2.0.g0547ba6
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/pinterf/Convolution3D'
license=('GPL')
depends=('libavisynth.so')
makedepends=('git'
             'cmake'
             'avisynthplus'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/Convolution3D.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  rm -fr "${_plug}/Convolution3D/"{avs*,avi*}
}

build() {

  CXXFLAGS=" $(pkg-config --cflags avisynth)"

  cmake -S "${_plug}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package(){
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/${_plug}/README.md"
}
