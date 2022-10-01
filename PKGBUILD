# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=nnedi3cl
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=8.0.geb2a810
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HomeOfVapourSynthEvolution/VapourSynth-NNEDI3CL'
license=('GPL2')
depends=('vapoursynth'
         'vapoursynth-plugin-nnedi3_weights_bin'
         'opencl-icd-loader'
         'libboost_filesystem.so'
         )
makedepends=('git'
             'opencl-headers'
             'boost'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-NNEDI3CL.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  mkdir -p build

  cd "${_plug}"
  sed 's/, meson.project_name()//g' \
    -i meson.build
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --buildtype=release \
    --libdir /usr/lib/vapoursynth \
    --datadir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"

  rm -fr "${pkgdir}/usr/lib/vapoursynth/NNEDI3CL"
}
