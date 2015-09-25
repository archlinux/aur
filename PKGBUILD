# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=genericfilters
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r131.de02ff0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?p=1656901#post1656901'
license=('LGPL2.1')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/myrsloik/GenericFilters.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -fr "${_plug}/src/common/VapourSynth.h"
}

build() {
  cd "${_plug}/src"
  ./configure --install="${pkgdir}/usr/lib/vapoursynth" \
              --extra-cflags="${CFLAGS} $(pkg-config --cflags vapoursynth)" \
              --extra-ldflags="${LDFLAGS}"
}

package(){
  make -C "${_plug}/src" install
  install -Dm644 "${_plug}/readme.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}
