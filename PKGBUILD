# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=histogram
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2.1.gc15398b
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build
}

build() {
  cd "${_plug}"
  ./autogen.sh

  cd "${srcdir}/build"
  "../${_plug}/configure" \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 "${_plug}/readme.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}
