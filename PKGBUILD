# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=eedi3m
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=4.7.gd11bdb3
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI3'
license=('GPL2')
depends=('vapoursynth'
         'opencl-icd-loader'
         'libboost_filesystem.so'
         )
makedepends=('git'
             'opencl-headers'
             'boost'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}"
           'vapoursynth-plugin-eedi3cl-git'
           )
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI3.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --buildtype=release \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
