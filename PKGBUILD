# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vmaf
pkgname=avisynth-plugin-${_plug}-git
pkgver=2.1.2.1.g8f9b597
pkgrel=2
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Asd-g/AviSynth-VMAF'
license=('GPL')
depends=('libavisynth.so'
         'vmaf'
         )
makedepends=('git'
             'cmake'
             'avisynthplus'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Asd-g/AviSynth-VMAF.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {

  cd "${_plug}"

  rm -fr src/{avs*,avi*}
  sed '1i#include <algorithm>' -i src/VMAF.cpp
  sed -e "/vmaf_install\/include/d" \
      -e '/x86_64-linux-gnu/c \ \ \ \ \ \ \ \ libvmaf.so' \
      -i CMakeLists.txt
}

build() {
  cd "${_plug}"

  cmake -S . -B build \
   -DCMAKE_BUILD_TYPE=None \
   -DCMAKE_INSTALL_PREFIX=/usr \
   -DCMAKE_CXX_FLAGS="${CXXFLAGS} $(pkg-config --cflags avisynth libvmaf)"

  cmake --build build

}

package(){
  DESTDIR="${pkgdir}" cmake --install "${_plug}/build"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"
}
