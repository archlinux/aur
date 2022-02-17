# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vstcanny
pkgname=avisynth-plugin-${_plug}-git
pkgver=1.1.5.1.gb8ca769
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Asd-g/AviSynth-vsTCanny'
license=('GPL' 'Apache')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Asd-g/AviSynth-vsTCanny.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_plug}"

  CXXFLAGS+=" $(pkg-config --cflags avisynth)" \
  cmake -B build -S . \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX=/usr \

  cmake --build build
}

package() {
  cd "${_plug}"
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 README.md "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"

  install -Dm644 src/VCL2/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/VCL2_LICENSE"
}
