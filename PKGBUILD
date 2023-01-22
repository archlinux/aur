# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=medianblur2
pkgname=avisynth-plugin-${_plug}-git
pkgver=1.1.7.ge45ab28
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/pinterf/MedianBlur2'
license=('MIT')
depends=('libavisynth.so')
makedepends=('git'
             'cmake'
             'avisynthplus'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/MedianBlur2.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  rm -fr "${_plug}/MedianBlur2/"{avs*,avi*}
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
