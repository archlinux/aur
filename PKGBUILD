# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsrawsource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.3.3.22.g42cca26
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=166075'
license=('LGPL2.1')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/maki-rxrz/${_plug}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_plug}"
  rm -fr VapourSynth.h
}

build() {
  cd "${_plug}"
  ./configure \
    --extra-cflags="${CFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth)" \
    --extra-ldflags="${LDFLAGS}"

  make
}

package(){
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
