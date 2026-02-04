# Maintainer: Ammann Max <maximilian.ammann@googlemail.com>
# Maintainer: NEOAPPS <neo@obsidianos.xyz> <asd22.info@gmail.com>
pkgname=mingw-w64-libmicrohttpd
pkgver=1.0.2
pkgrel=1
pkgdesc="GNU libmicrohttpd is a small C library that is supposed to make it easy to run an HTTP server as part of another application"
arch=('any')
url="https://www.gnu.org/software/libmicrohttpd/"
license=('GPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-$pkgver.tar.gz")
sha256sums=('df324fcd0834175dab07483133902d9774a605bfa298025f69883288fd20a8c7')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libmicrohttpd-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libmicrohttpd-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
