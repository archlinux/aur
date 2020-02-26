# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vmaf
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r6.0.gf1b7159
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=175862'
license=('GPL')
depends=('vapoursynth'
         'vmaf'
         )
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-VMAF.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  # rename models path
  sed "s|model/|${_plug}-models/|g" -i "${_plug}/VMAF/VMAF.cpp"
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  mv "${pkgdir}/usr/lib/vapoursynth/model" "${pkgdir}/usr/lib/vapoursynth/${_plug}-models"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
