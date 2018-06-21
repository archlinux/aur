# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libdatrie
pkgver=0.2.12
pkgrel=1
pkgdesc="Implementation of double-array structure for representing trie, as proposed by Junichi Aoe. (mingw-w64)"
arch=('any')
url="https://linux.thai.net/projects/datrie"
license=('LGPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt' 'mingw-w64-libiconv')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://linux.thai.net/pub/thailinux/software/libthai/libdatrie-${pkgver}.tar.xz")
sha256sums=('452dcc4d3a96c01f80f7c291b42be11863cd1554ff78b93e110becce6e00b149')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  export ac_cv_func_malloc_0_nonnull=yes
  cd "${srcdir}/libdatrie-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libdatrie-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
