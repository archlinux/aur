# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=wwxd
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v1.0.0.ga587086
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=170546"
license=('GPL2')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git")
md5sums=('SKIP')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_gitname}"
  echo "all:
	  gcc -o lib${_plug}.so ${CFLAGS} -fPIC -shared -Wall -Wextra -Wno-unused-parameter src/wwxd.c src/detection.c $(pkg-config --cflags vapoursynth) " > Makefile
}

build() {
  cd "${_gitname}"
  make
}

package(){
  cd "${_gitname}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 readme "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme"
}
