# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=addgrainc
pkgname=avisynth-plugin-${_plug}-git
pkgver=1.8.4.0.g7e280a2
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/pinterf/AddGrainC'
license=('GPL')
depends=('libavisynth.so')
makedepends=('git'
             'cmake'
             'avisynthplus'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/pinterf/AddGrainC.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  rm -fr "${_plug}/AddGrainC/"{avs*,avi*}
}

build() {
  CXXFLAGS+=" $(pkg-config --cflags avisynth)"

  cmake -S "${_plug}" -B build \
   -DCMAKE_BUILD_TYPE=None \
   -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package(){
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_plug}/Documentation/AddGrainC.txt" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/AddGrainC.txt"
  install -Dm644 "${_plug}/Documentation/addgrain.avs"  "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/addgrainc.avs"
}
