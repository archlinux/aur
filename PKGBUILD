# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=lsmashsource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r804.03117ec
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=167435'
license=('LGPL')
depends=('vapoursynth' 'l-smash-git')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/VFR-maniac/L-SMASH-Works.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -fr "${_plug}/VapourSynth/VapourSynth.h"
}

build() {
  cd "${_plug}/VapourSynth"
  ./configure --prefix=/usr \
              --extra-cflags="${CFLAGS} $(pkg-config --cflags vapoursynth)" \
              --extra-ldflags="${LDFLAGS}"
  make
}

package(){
  cd "${_plug}/VapourSynth"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
