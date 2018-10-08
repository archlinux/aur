# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libbaseencode
pkgver=1.0.9
pkgrel=1
pkgdesc="Library written in C for encoding and decoding data using base32 or base64 (RFC-4648) (mingw-w64)"
arch=('any')
url="https://github.com/paolostivanin/libbaseencode"
license=('GPL3')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/paolostivanin/libbaseencode/archive/v${pkgver}.tar.gz"
        "fix-dll-install.patch")
sha256sums=('a183d7cf30d931b2a078d6f0ef64616b71ab26f9258e5f4e191778c7ace7175d'
            '8249f3fc0c7d66469b84339590eb68ed882a8ed1dc75cbaa62ef1b9e4a6b16aa')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libbaseencode-${pkgver}"
  patch -Np1 -i "${srcdir}/fix-dll-install.patch"
}

build() { 
  cd "${srcdir}/libbaseencode-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libbaseencode-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
