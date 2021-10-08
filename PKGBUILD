# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=dedot
pkgname=avisynth-plugin-${_plug}-git
pkgver=1.2.1.1.gb49fea2
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Asd-g/AviSynth-DeDot'
license=('GPL' 'Apache')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Asd-g/AviSynth-DeDot.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p "${_plug}/build"
}

build() {
  cd "${_plug}/build"

  CXXFLAGS+=" $(pkg-config --cflags avisynth)" cmake .. \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX=/usr \

  make
}

package(){
  make -C "${_plug}/build" DESTDIR="${pkgdir}" install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"

  install -Dm644 "${_plug}/src/VCL2/LICENSE" "${pkgdir}/usr/share/license/${_plug}/VCL2_LICENSE"
}
