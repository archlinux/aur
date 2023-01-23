# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=yadifmod2
pkgname=avisynth-plugin-${_plug}-git
pkgver=0.2.7.1.g0e4e2f9
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Asd-g/yadifmod2'
license=('GPL')
depends=('libavisynth.so')
makedepends=('git'
             'cmake'
             'avisynthplus'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Asd-g/yadifmod2.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_plug}"

  CXXFLAGS+=" $(pkg-config --cflags avisynth)"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package(){
  DESTDIR="${pkgdir}" cmake --install "${_plug}/build"

  install -Dm644 "${_plug}/readme.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"
}
