# Maintainer: Roboron <robertoms258 at gmail dot com>
 
_realname=fluidsynth
pkgname=mingw-w64-fluidsynth
pkgver=2.6.1
pkgrel=1
pkgdesc="A real-time software synthesizer based on the SoundFont 2 specifications (mingw-w64)"
url="http://www.fluidsynth.org/"
arch=('any')
license=('LGPL')
depends=('mingw-w64-glib2'
  'mingw-w64-libsndfile'
  'mingw-w64-portaudio'
  'mingw-w64-readline'
  'mingw-w64-sdl2')
makedepends=('mingw-w64-cmake'
  'mingw-w64-pkg-config'
  'mingw-w64-make')
options=('staticlibs' '!buildflags' '!strip')
source=("${_realname}-${pkgver}.tar.gz::https://github.com/FluidSynth/${_realname}/archive/v${pkgver}.tar.gz")
sha256sums=('3d258a3bf97cc20c59eeebfe62c2432fae88adda74d3ad098681c76e0ebf446b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd fluidsynth-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_SHARED_LIBS=0 -Denable-portaudio=1 -Denable-dbus=0 ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/fluidsynth-${pkgver}/build-${_arch}
    ${_arch}-make install DESTDIR="$pkgdir"
  done
}
