# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fmtconv_wrapper
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r7
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=170633'
license=('GPL')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
depends=('vapoursynth')
makedepends=('git')
source=("${_plug}::git+https://gist.github.com/c250a0dfefbfb113e925.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  printf "r%s" "$(git rev-list --count HEAD)"
}

prepare() {
  cd "${_plug}"
  echo "all:
	  gcc -c -std=c99 -fPIC -Wextra -Wno-unused-parameter ${CFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o fmtcwrap.o fmtcwrap.c
	  gcc -shared -fPIC ${LDFLAGS} -o lib${_plug}.so fmtcwrap.o" > Makefile
}

build() {
  cd "${_plug}"
  make
}

package(){
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 readme.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.txt"
}
