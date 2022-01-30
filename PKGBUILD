# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-xerces-c
pkgver=3.2.3
pkgrel=1
pkgdesc="A validating XML parser written in a portable subset of C++ (mingw-w64)"
arch=(any)
url="https://xerces.apache.org/xerces-c/"
license=("APACHE")
makedepends=('mingw-w64-configure' 'mingw-w64-wine')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://archive.apache.org/dist/xerces/c/3/sources/xerces-c-${pkgver}.tar.gz"
        "001-no-undefined.patch"
        "fix-cross-compile.patch"
        "002-duplicate-instantiation.patch")
md5sums=('a5fa4d920fce31c9ca3bfef241644494'
         'ca44fe043987da1f54e00d1aba3e6012'
         '0fd713ab5edac90c99462f8869193868'
         '38dcb94149cfd0f7ab6e17a7b80cd143')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/xerces-c-${pkgver}"
  patch -p1 -i "${srcdir}/001-no-undefined.patch"
  patch -p1 -i "${srcdir}/fix-cross-compile.patch"
  patch -p1 -i "${srcdir}/002-duplicate-instantiation.patch"

  autoreconf -fiv
}

build() {
  cd "${srcdir}/xerces-c-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    LIBS+=" -lssp" ${_arch}-configure \
      --without-icu \
      --without-curl
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/xerces-c-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
