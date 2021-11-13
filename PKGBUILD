# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vmaf
pkgname=avisynth-plugin-${_plug}-git
pkgver=2.0.2.0.g9bc3774
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Asd-g/AviSynth-VMAF'
license=('GPL')
depends=('avisynthplus')
makedepends=('git'
             'cmake'
             'meson'
             'nasm'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Asd-g/AviSynth-VMAF.git"
        'libvmaf::git+https://github.com/Netflix/vmaf.git'
        )
sha256sums=('SKIP'
            'SKIP'
            )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build-vmaf

  cd "${_plug}"
  mkdir -p build

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

  cd "${srcdir}/${_plug}/build"

   PKG_CONFIG_PATH="${srcdir}/fakeroot/usr/lib/pkgconfig" \
   CXXFLAGS+=" $(pkg-config --cflags avisynth)" \
   cmake .. \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_INSTALL_PREFIX=/usr \

  make
}

package(){
  make -C "${_plug}/build" DESTDIR="${pkgdir}" install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"
}
