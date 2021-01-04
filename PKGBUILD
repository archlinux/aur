# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=tcolormask
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r1.2.g525d8b2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Beatrice-Raws/VapourSynth-TColorMask'
license=('MIT')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Beatrice-Raws/VapourSynth-TColorMask.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare(){
  cd "${_plug}"

  echo "all:
	  g++ -c -fPIC ${CXXFLAGS} -std=c++11 ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o TColorMask.o TColorMask/TColorMask.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so TColorMask.o" > Makefile

}

build() {
  LC_ALL=C make -C "${_plug}" -j1
}

package() {
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/README.md"
}
