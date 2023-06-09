# Maintainer: Joao Valverde <j at v6e dot pt>

pkgname=mingw-w64-libpcap
pkgver=1.10.4
pkgrel=1
pkgdesc="A system-independent interface for user-level packet capture (mingw-w64)"
arch=('any')
url="https://www.tcpdump.org/"
license=('GPL')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt'
         'mingw-w64-openssl')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://www.tcpdump.org/release/libpcap-$pkgver.tar.gz")
sha256sums=('ed19a0383fad72e3ad435fd239d7cd80d64916b87269550159d20e47160ebe5f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() { 
  cd "$srcdir/libpcap-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DPCAP_TYPE=null ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libpcap-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
