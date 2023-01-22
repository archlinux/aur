# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=smoothuv2
pkgname=avisynth-plugin-${_plug}-git
pkgver=4.4.1.0.g128f09c
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Asd-g/AviSynth-SmoothUV2'
license=('GPL' 'Apache')
depends=('libavisynth.so')
makedepends=('git'
             'cmake'
             'avisynthplus'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Asd-g/AviSynth-SmoothUV2.git")
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

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"

  install -Dm644 "${_plug}/src/VCL2/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/VCL2_LICENSE"
}
