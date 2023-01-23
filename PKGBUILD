# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vmaf
pkgname=avisynth-plugin-${_plug}-git
pkgver=2.1.2.1.g8f9b597
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Asd-g/AviSynth-VMAF'
license=('GPL')
depends=('libavisynth.so')
makedepends=('git'
             'cmake'
             'meson'
             'nasm'
             'avisynthplus'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Asd-g/AviSynth-VMAF.git"
        'libvmaf::git+https://github.com/Netflix/vmaf.git'
        )
sha256sums=('SKIP'
            'SKIP'
            )
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build-vmaf

  cd "${_plug}"

  rm -fr src/{avs*,avi*}
  sed '1i#include <algorithm>' -i src/VMAF.cpp
  sed -e 's|APPEND CMAKE_CXX_FLAGS|APPEND ${CMAKE_CXX_FLAGS}|g' \
      -e "/vmaf_install\/include/c${srcdir}/fakeroot/usr/include" \
      -e "/vmaf_install\/lib/c${srcdir}/fakeroot/usr/lib/libvmaf.a" \
      -e "/AviSynth.lib/c$(pkg-config --libs avisynth)" \
      -i CMakeLists.txt
}

build() {
  cd "${srcdir}/build-vmaf"
    arch-meson  ../libvmaf/libvmaf \
     --default-library=static \
     --prefix="${srcdir}/fakeroot/usr" \
     -Denable_tests=false \
     -Denable_docs=false \
     -Dbuilt_in_models=true

  ninja install

  cd "${srcdir}/${_plug}"

  CXXFLAGS+=" $(pkg-config --cflags avisynth)"

  PKG_CONFIG_PATH="${srcdir}/fakeroot/usr/lib/pkgconfig" \
  cmake -S . -B build \
   -DCMAKE_BUILD_TYPE=None \
   -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package(){
  DESTDIR="${pkgdir}" cmake --install "${_plug}/build"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"
}
