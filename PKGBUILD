# Maintainer : Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Yamashita Ren

_plug=waifu2x-w2xc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r7.0.g4128c53
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Waifu2x-w2xc'
license=('GPL2')
depends=('vapoursynth'
         'waifu2x-converter-cpp'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-${_plug}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd "${_plug}"
  ./autogen.sh

  cd "${srcdir}/build"
  ../"${_plug}"/configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install
  cp -R "${_plug}/Waifu2x-w2xc/models" ${pkgdir}/usr/lib/vapoursynth/models
  chmod -R a+w ${pkgdir}/usr/lib/vapoursynth/models
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
