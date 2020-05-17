
_realname=fluidsynth
pkgname=mingw-w64-fluidsynth
pkgver=2.1.2
pkgrel=2
pkgdesc="A real-time software synthesizer based on the SoundFont 2 specifications (mingw-w64)"
url="http://www.zstd.net/"
arch=('any')
license=('BSD' 'GPL2')
depends=('mingw-w64-gcc'
  'mingw-w64-glib2'
  'mingw-w64-libsndfile'
  'mingw-w64-portaudio'
  'mingw-w64-readline')
makedepends=('mingw-w64-cmake'
  'mingw-w64-pkg-config')
options=('staticlibs' '!buildflags' '!strip')
source=("${_realname}-${pkgver}.tar.gz::https://github.com/FluidSynth/${_realname}/archive/v${pkgver}.tar.gz")
sha256sums=('9206d83b8d2f7e1ec259ee01e943071de67e419aabe142b51312f8edb39c5503')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd fluidsynth-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_INSTALL_PREFIX=$pkgdir/usr/${_arch} \
      -DBUILD_SHARED_LIBS=OFF \
      -DBUILD_STATIC_LIBS=ON \
      -Denable-portaudio=ON \
      -Denable-dbus=OFF \
      ..
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

