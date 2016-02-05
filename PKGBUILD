# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=tc2cfr
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v0.0.1.3.gf5f52f3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/gnaggnoyil/${_plug}"
license=('BSD')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/gnaggnoyil/${_plug}.git"
        'patch.patch')
sha1sums=('SKIP'
          '415d78cd88311c9b884f29ad570a96b558551d19')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  rm -fr "${_plug}/"{VapourSynth,VSHelper}.h

  patch -p1 -i "${srcdir}/patch.patch"

  echo "all:
	  g++ -c -std=gnu++11 -I. -fPIC ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o Backend.o ${_plug}/Backend.cpp
	  g++ -c -std=gnu++11 -I. -fPIC ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o VSFrontend.o ${_plug}/VSFrontend.cpp
	  g++ -c -std=gnu++11 -I. -fPIC ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o AVSrontend.o ${_plug}/AVSFrontend.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so *.o" > Makefile
}

build() {
  make
}

package(){
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 "${_plug}/LICENSE.BSD2c" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD2c"
}
