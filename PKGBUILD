# Maintainer: Pavel Cadersky <aur-ahshaev8@mess.cz>

pkgname=mingw-w64-c-ares
pkgver=1.34.5
pkgrel=1
pkgdesc="C library that performs DNS requests and name resolves asynchronously (mingw-w64)"
arch=('any')
url="https://c-ares.haxx.se/"
license=('MIT')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/c-ares/c-ares/releases/download/v${pkgver}/c-ares-${pkgver}.tar.gz")
sha256sums=('7d935790e9af081c25c495fd13c2cfcda4792983418e96358ef6e7320ee06346')

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
