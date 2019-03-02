# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=readmpls
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r3.1.g2a0f835
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=174580'
license=('GPL3')
depends=('libbluray.so'
         'vapoursynth'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-ReadMpls.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd "${_plug}"
  ./autogen.sh
}

build() {
  cd build
  ../"${_plug}"/configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
