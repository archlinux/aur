# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=dotkill
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R1.1.g84a0e13
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=173029'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
source=("${_plug}::git+https://github.com/myrsloik/DotKill.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare(){
  cd "${_plug}"

  echo "all:
	  g++ -c -std=gnu++11 -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o dotkill1.o dotkill1.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so dotkill1.o" > Makefile
}

build() {
  make -C "${_plug}"
}

package() {
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
