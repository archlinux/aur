pkgname=mingw-w64-libssh2
pkgver=1.4.3
pkgrel=3
pkgdesc="A library implementing the SSH2 protocol as defined by Internet Drafts (mingw-w64)"
arch=(any)
url="http://www.libssh2.org"
license=("BSD")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt mingw-w64-openssl)
options=(staticlibs !strip !buildflags)
source=("$url/download/${pkgname#mingw-w64-}-$pkgver.tar.gz")
md5sums=('071004c60c5d6f90354ad1b701013a0b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/libssh2-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libssh2-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

