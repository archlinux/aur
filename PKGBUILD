# Maintainer: Andrew Kozik <andrewkoz at live dot com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-libuv
_pkgname=libuv
pkgver=1.53.0
pkgrel=1
pkgdesc="Multi-platform support library with a focus on asynchronous I/O (mingw-w64)"
arch=('any')
url="https://github.com/libuv/libuv"
license=('MIT')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' '!debug' 'staticlibs')
source=("https://github.com/libuv/libuv/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('8f26c14b016368a8e382539026e1fa3cf187a7cc8bd8b50498a9b26003e9da3e48a89f4d2032694e5f152cd4177386e259b85e8280cf814153ab58950d205014')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    ${_arch}-cmake -B . -S ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
