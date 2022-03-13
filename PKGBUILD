# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=minsharp
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=4.2.gf90c5a7
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=173328'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/minsrp.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  mkdir -p build

  cd "${_plug}"
  rm -fr src/VapourSynth.h src/VSHelper.h
}

build() {
  cd "${_plug}/build/unix"
  ./autogen.sh

  cd "${srcdir}/build"
  CXXFLAGS+=" $(pkg-config --cflags vapoursynth)" \
  "../${_plug}/build/unix/configure" \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install
}
