# Maintainer: Andrew Sun <adsun701@gmail.com>
# Maintainer: Joao Valverde <j at v6e dot pt>

pkgname=mingw-w64-c-ares
pkgver=1.19.1
pkgrel=1
pkgdesc="C library that performs DNS requests and name resolves asynchronously (mingw-w64)"
arch=('any')
url="https://c-ares.haxx.se/"
license=('MIT')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://c-ares.org/download/c-ares-${pkgver}.tar.gz")
sha256sums=('321700399b72ed0e037d0074c629e7741f6b2ec2dda92956abe3e9671d3e268e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/c-ares-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMAKE_SHARED_LIBRARY_NAME_WITH_VERSION=ON ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/c-ares-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install

    # remove documentation
    rm -rf "$pkgdir"/usr/${_arch}/share/man
    rmdir "$pkgdir"/usr/${_arch}/share

    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
