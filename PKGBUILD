# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=convo2d
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r15.39fdd09
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/chikuzen/${_plug}"
license=('LGPL2.1')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/chikuzen/${_plug}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_plug}"
  rm VapourSynth.h
}

build() {
  cd "${_plug}"
  ./configure --extra-cflags="${CFLAGS} $(pkg-config --cflags vapoursynth)" \
              --extra-ldflags="${LDFLAGS}"
  make
}

package(){
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.rst"
}

