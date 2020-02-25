# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=arearesize
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r1.5.g77d9b09
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=180415'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
source=("${_plug}::git+https://github.com/Kiyamou/VapourSynth-AreaResize.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare(){
  cd "${_plug}"

  echo "all:
	  g++ -c -std=gnu++14 -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o AreaResize.o AreaResize/AreaResize.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so AreaResize.o" > Makefile
}

build() {
  make -C "${_plug}"
}

package() {
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
