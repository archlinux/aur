pkgname=mingw-w64-fftw
pkgver=3.3.9
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT) (mingw-w64)"
arch=('any')
url="http://www.fftw.org"
license=("GPL")
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
checkdepends=('mingw-w64-wine')
options=(staticlibs !strip !buildflags)
source=("$url/fftw-${pkgver}.tar.gz")
sha256sums=('bf2c7ce40b04ae811af714deb512510cc2c17b9ab9d6ddcf49fe4487eea7af3d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/fftw-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-d && pushd build-${_arch}-d
    ${_arch}-configure \
      --disable-dependency-tracking \
      --disable-threads
    make
    popd

    mkdir -p build-${_arch}-ld && pushd build-${_arch}-ld
    ${_arch}-configure \
      --enable-long-double \
      --disable-dependency-tracking \
      --disable-threads
    make
    popd

    mkdir -p build-${_arch}-f && pushd build-${_arch}-f
    ${_arch}-configure \
      --enable-float \
      --disable-dependency-tracking \
      --disable-threads
    make
    popd

    mkdir -p build-${_arch}-q && pushd build-${_arch}-q
    ${_arch}-configure \
      --enable-quad-precision \
      --disable-dependency-tracking \
      --disable-threads
    make
    popd
  done
}

check() {
  cd "${srcdir}/fftw-${pkgver}"

  # run tests through wine
  sed -i "s|\$program=\$arglist\[0\]|\$program=\"wine \$arglist[0]\"|g" tests/check.pl

  for _arch in ${_architectures}; do
    cd "${srcdir}/fftw-${pkgver}/build-${_arch}-d"
    ${_arch}-wine tests/bench.exe --verbose=1 --verify 'ofcd7*1' --verify 'ifr40x13v32' --verify 'ifcd10x9x5*10'
    #make check
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/fftw-${pkgver}/build-${_arch}-d"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/fftw-${pkgver}/build-${_arch}-ld"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/fftw-${pkgver}/build-${_arch}-f"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/fftw-${pkgver}/build-${_arch}-q"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm "$pkgdir/usr/${_arch}/bin/fftw-wisdom-to-conf"
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}

