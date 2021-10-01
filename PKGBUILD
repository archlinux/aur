 
_realname=fluidsynth
pkgname=mingw-w64-fluidsynth
pkgver=2.2.3
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
sha256sums=('b31807cb0f88e97f3096e2b378c9815a6acfdc20b0b14f97936d905b536965c4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd fluidsynth-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_INSTALL_PREFIX=/usr/${_arch} -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON -Denable-portaudio=ON -Denable-dbus=OFF ..
	# If you only need the bare minimum to play .sf2 soundfonts, use this instead
    #${_arch}-cmake -DCMAKE_INSTALL_PREFIX=/usr/${_arch}  -DBUILD_SHARED_LIBS=0 -DBUILD_STATIC_LIBS=1 -Denable-aufile=0 -Denable-dbus=0 -Denable-ipv6=0 -Denable-jack=0 -Denable-ladspa=0 -Denable-midishare=0 -Denable-opensles=0 -Denable-oboe=0 -Denable-oss=0 -Denable-readline=0 -Denable-winmidi=0 -Denable-waveout=0 -Denable-libsndfile=0 -Denable-network=0 -Denable-pulseaudio=0 -Denable-dsound=1 -Denable-sdl2=0 ..
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
