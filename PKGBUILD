pkgname=mingw-w64-nfft
pkgver=3.3.2
pkgrel=1
pkgdesc="Library for computing Non-uniform Fast Fourier Transforms. (mingw-w64)"
arch=('any')
url="https://www-user.tu-chemnitz.de/~potts/nfft/"
license=("GPL2")
depends=('mingw-w64-fftw')
makedepends=('mingw-w64-configure')
options=(staticlibs !strip !buildflags)
source=("https://github.com/NFFT/nfft/releases/download/$pkgver/nfft-$pkgver.tar.gz")
md5sums=('13e48b923501ed6feb5130c3be115fc8')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/nfft-${pkgver}"

  wget https://github.com/NFFT/nfft/pull/30.patch
  patch -p1 -i 30.patch

  autoreconf -vfi
}

build() {
  cd "${srcdir}/nfft-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/nfft-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}

