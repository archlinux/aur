pkgname=mingw-w64-fftw
pkgver=3.3.6
pkgrel=1
pkgdesc="A library for computing the discrete Fourier transform (DFT) (mingw-w64)"
arch=('any')
url="http://www.fftw.org"
license=("GPL")
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
checkdepends=('wine')
options=(staticlibs !strip !buildflags)
source=("$url/fftw-${pkgver}-pl1.tar.gz")
md5sums=('682a0e78d6966ca37c7446d4ab4cc2a1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/fftw-${pkgver}-pl1"
  for _arch in ${_architectures}; do
    unset LDFLAGS
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
  cd "${srcdir}/fftw-${pkgver}-pl1"

  # run tests through wine
  sed -i "s|\$program=\$arglist\[0\]|\$program=\"wine \$arglist[0]\"|g" tests/check.pl

  for _arch in ${_architectures}; do
    cd "${srcdir}/fftw-${pkgver}-pl1/build-${_arch}-d"
    make check
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/fftw-${pkgver}-pl1/build-${_arch}-d"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/fftw-${pkgver}-pl1/build-${_arch}-ld"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/fftw-${pkgver}-pl1/build-${_arch}-f"
    make DESTDIR="$pkgdir" install
    cd "${srcdir}/fftw-${pkgver}-pl1/build-${_arch}-q"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm "$pkgdir/usr/${_arch}/bin/fftw-wisdom-to-conf"
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}

