# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=lsmashsource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r783.49b0813
_pkgver="$(echo ${pkgver} | cut -d '.' -f1 | tr -d r)"
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=167435"
license=('LGPL')
depends=('vapoursynth' 'l-smash-git')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/VFR-maniac/L-SMASH-Works.git")
md5sums=('SKIP')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  echo "r$(git rev-list HEAD 2> /dev/null | wc -l | sed 's/ //g').$(git describe --always)"
}

prepare() {
  rm "${_gitname}/VapourSynth/VapourSynth.h"
}

build() {
  cd "${_gitname}/VapourSynth"
  ./configure --prefix=/usr --extra-cflags="$(pkg-config --cflags vapoursynth)"
  make
}

package(){
  cd "${_gitname}/VapourSynth"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"

}
