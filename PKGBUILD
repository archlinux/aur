# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=neo_f3kdb
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r2.0.gf805e0f
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HomeOfAviSynthPlusEvolution/neo_f3kdb.git'
license=('GPL3')
depends=('vapoursynth')
makedepends=('git'
             'cmake'
             'clang'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}"
           )
source=("${_plug}::git+https://github.com/HomeOfAviSynthPlusEvolution/neo_f3kdb.git"
        'esee.patch'
        )
sha256sums=('SKIP'
            '59eba3e8fe7c4a8b89d765c13d9928bcf311a5985d2c52baf95964b1cb46b337'
            )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  patch -p1 -i "${srcdir}/esee.patch"

  rm -fr src/vapoursynth/{VapourSynth,VSHelper}.h

  sed -e 's|"Vapoursynth.h"|<Vapoursynth.h>"|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i src/gen_filter_def.py \
      -i src/vapoursynth/plugin.def.h \
      -i src/vapoursynth/plugin.cpp \
      -i src/vapoursynth/plugin.h

  mkdir -p build
}

build() {
  cd "${_plug}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_COMPILER=clang \
    -DCMAKE_CXX_COMPILER=clang++ \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} $(pkg-config --cflags vapoursynth)"

  make
}

package() {
  install -Dm644 "${_plug}/build/neo-f3kdb.so" "${pkgdir}/usr/lib/vapoursynth/libneo-f3kdb.so"
}
