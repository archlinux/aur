pkgname=mingw-w64-primesieve
pkgver=12.16
pkgrel=1
pkgdesc="Fast prime number generator (mingw-w64)"
url="https://github.com/kimwalisch/primesieve"
license=(BSD)
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/kimwalisch/primesieve/archive/v$pkgver.tar.gz")
sha256sums=('753530ec2b4cbf3b62808b0661ab00e0382d47bded8a57c4fe41a6a4409f7c94')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd "$srcdir/primesieve-${pkgver}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DWITH_MULTIARCH=OFF -DBUILD_PRIMESIEVE=OFF -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir/primesieve-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" cmake --install build-${_arch}
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
