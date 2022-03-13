# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=combmask
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.1.0.1.g9c708d7
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="https://github.com/chikuzen/${_plug}"
license=('LGPL2.1')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/chikuzen/${_plug}.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}/vapoursynth/src"
  rm -fr VapourSynth.h

  chmod +x configure
}

build() {
  cd "${_plug}/vapoursynth/src"
  ./configure \
    --extra-cflags="${CFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth)" \
    --extra-ldflags="${LDFLAGS}"

  make
}

package(){
  cd "${_plug}/vapoursynth/src"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 ../readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.rst"
}

