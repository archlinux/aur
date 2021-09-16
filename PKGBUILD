# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=eedi3cl
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r4.7.gd11bdb3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI3'
license=('GPL2')
depends=('vapoursynth'
         'opencl-icd-loader'
         )
makedepends=('git'
             'opencl-headers'
             'boost'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}"
          'vapoursynth-plugin-eedi3'
          )
conflicts=("vapoursynth-plugin-${_plug}"
           'vapoursynth-plugin-eedi3-ocl'
           )
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-EEDI3.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
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
