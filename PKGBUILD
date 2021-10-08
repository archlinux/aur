# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vmaf
pkgname=avisynth-plugin-${_plug}-git
pkgver=2.0.1.0.g048b52a
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Asd-g/AviSynth-VMAF'
license=('GPL')
depends=('avisynthplus'
         'vmaf'
         )
makedepends=('git'
             'cmake'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Asd-g/AviSynth-VMAF.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  mkdir -p build

  rm -fr src/{avs*,avi*}
  sed '1i#include <algorithm>' -i src/VMAF.cpp
  sed -e 's|APPEND CMAKE_CXX_FLAGS|APPEND ${CMAKE_CXX_FLAGS}|g' \
      -e "/vmaf_install\/include/c$(pkg-config --cflags libvmaf | sed 's|-I||')" \
      -e "/vmaf_install\/lib/c$(pkg-config --libs libvmaf)" \
      -e "/AviSynth.lib/c$(pkg-config --libs avisynth)" \
      -i CMakeLists.txt
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
}
