# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=colorbars
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=3.1.g0e1f01b
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/ifb/vapoursynth-colorbars'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/ifb/vapoursynth-${_plug}.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d R)"
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

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
