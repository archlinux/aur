# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=autocrop
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.1.5.g418189c
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Irrational-Encoding-Wizardry/vapoursynth-autocrop'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/vapoursynth-autocrop.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"

  echo "all:
	  g++ -c -std=c++11 -Wall -fPIC ${CFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o autocrop.o autocrop.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so autocrop.o" > Makefile
}

build() {
  make -C "${_plug}"
}

package(){
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
