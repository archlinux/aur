# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=minideen
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2.0.g8b915c5
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('GPL')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             )
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
  cd build
  CXXFLAGS="${CXXFLAGS//-march=x86-64 -mtune=generic/-march=native} -fpeel-loops" \
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/readme.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}

