# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=tc2cfr
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.0.1.3.gf5f52f3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="https://github.com/gnaggnoyil/${_plug}"
license=('BSD')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/gnaggnoyil/${_plug}.git"
        'patch.patch'
        )
sha256sums=('SKIP'
            '6c9b13d19f757f6c741d58fc349a70f7450351db8c66210ab47ec4939ee026c0'
            )
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd "${_plug}"
  rm -fr VapourSynth.h VSHelper.h

  patch -p2 -i "${srcdir}/patch.patch"

  echo "all:
	  g++ -c -std=gnu++11 -I. -fPIC ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o Backend.o Backend.cpp
	  g++ -c -std=gnu++11 -I. -fPIC ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o VSFrontend.o VSFrontend.cpp
	  g++ -c -std=gnu++11 -I. -fPIC ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o AVSrontend.o AVSFrontend.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so Backend.o VSFrontend.o AVSrontend.o" > Makefile
}

build() {
  make -C "${_plug}"
}

package() {
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE.BSD2c "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD2c"
}
