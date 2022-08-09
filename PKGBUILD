# Maintainer: Roboron <robertoms258 at gmail dot com>
 
_realname=fluidsynth
pkgname=mingw-w64-fluidsynth
pkgver=2.2.8
pkgrel=1
pkgdesc="A real-time software synthesizer based on the SoundFont 2 specifications (mingw-w64)"
url="http://www.fluidsynth.org/"
arch=('any')
license=('LGPL')
depends=('mingw-w64-glib2'
  'mingw-w64-libsndfile'
  'mingw-w64-portaudio'
  'mingw-w64-readline')
makedepends=('mingw-w64-cmake'
  'mingw-w64-pkg-config'
  'mingw-w64-make')
options=('staticlibs' '!buildflags' '!strip')
source=("${_realname}-${pkgver}.tar.gz::https://github.com/FluidSynth/${_realname}/archive/v${pkgver}.tar.gz")
sha256sums=('7c29a5cb7a2755c8012d941d1335da7bda957bbb0a86b7c59215d26773bb51fe')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd fluidsynth-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    
	# If you need every feature, use this
    ${_arch}-cmake -DBUILD_SHARED_LIBS=0 -Denable-portaudio=1 -Denable-dbus=0 ..
	
	# If you only need the bare minimum to play with SF2/SF3 soundfonts with SDL2, uncomment this instead
    #${_arch}-cmake -DBUILD_SHARED_LIBS=0 -Denable-aufile=0 -Denable-dbus=0 -Denable-ipv6=0 -Denable-jack=0 -Denable-ladspa=0 -Denable-midishare=0 -Denable-opensles=0 -Denable-oboe=0 -Denable-oss=0 -Denable-readline=0 -Denable-winmidi=0 -Denable-waveout=0 -Denable-network=0 -Denable-pulseaudio=0 -Denable-dsound=0 -Denable-alsa=0 -Denable-libinstpatch=0 -Denable-libsndfile=1 -Denable-sdl2=1 ..
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
