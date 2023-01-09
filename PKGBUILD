# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=mvtools
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=23.8.g8ec2a19
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url="https://forum.doom9.org/showthread.php?t=171207"
license=('GPL')
depends=('vapoursynth'
         'fftw'
         )
makedepends=('git'
             'nasm'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . |tr -d v)"
}

prepare() {
  mkdir -p build

  CFLAGS="${CFLAGS/-O2/-O3}"
  CXXFLAGS="${CXXFLAGS/-O2/-O3}"
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/readme.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}
