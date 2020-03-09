# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=tcolormask
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r1.0.g85d90a5
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Beatrice-Raws/VapourSynth-TColorMask'
license=('MIT')
depends=('vapoursynth')
makedepends=('git')
source=("${_plug}::git+https://github.com/Beatrice-Raws/VapourSynth-TColorMask.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare(){
  cd "${_plug}"

  echo "all:
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o TColorMask.o TColorMask/TColorMask.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so TColorMask.o" > Makefile
}

build() {
  make -C "${_plug}"
}

package() {
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/README.md"
}
