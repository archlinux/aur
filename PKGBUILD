# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=minsharp
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r1.5.g4103f3d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=173328'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/minsrp.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  rm -fr src/VapourSynth.h src/VSHelper.h

  cd build/unix
  ./autogen.sh
}

build() {
  cd "${_plug}/build/unix"
  CXXFLAGS+=" $(pkg-config --cflags vapoursynth)" \
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth
  make
}

package(){
  cd "${_plug}/build/unix"
  make DESTDIR="${pkgdir}" install
}
