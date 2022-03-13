# Maintainer : Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Yamashita Ren

_plug=waifu2x-w2xc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=8.3.ga9f064a
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Waifu2x-w2xc'
license=('GPL2')
depends=('vapoursynth'
         'waifu2x-converter-cpp'
         )
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-${_plug}.git")
sha1sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  mkdir -p build

  # rename models folder
  sed "s|models/|${_plug}-models/|g" -i "${_plug}/Waifu2x-w2xc/Waifu2x-w2xc.cpp"
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  mv "${pkgdir}/usr/lib/vapoursynth/models" "${pkgdir}/usr/lib/vapoursynth/${_plug}-models"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
