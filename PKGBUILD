# Maintainer: Dario Ostuni <another.code.996@gmail.com>
_pkgname=duktape
pkgname=mingw-w64-${_pkgname}
pkgver=1.4.0
_dirname=${_pkgname}-${pkgver}
pkgrel=2
pkgdesc="Embeddable Javascript engine"
arch=('any')
url="http://duktape.org/"
license=("MIT")
makedepends=('mingw-w64-gcc')
depends=('mingw-w64-crt')
options=(staticlibs !strip !buildflags)
source=("http://duktape.org/duktape-1.4.0.tar.xz")
sha256sums=("6be060a61e2893856be662196ba4ee9529becf352c0678e93a6709e2418dbdb8")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    pushd "${srcdir}/${_dirname}" > /dev/null
    ${_arch}-gcc src/duktape.c -std=c99 -O2 -c -o duktape.o
    ${_arch}-ar rcs libduktape.a duktape.o
    pushd "../${pkgname}-${pkgver}-build-${_arch}" > /dev/null
    mv "${srcdir}/${_dirname}/libduktape.a" "libduktape.a"
    rm "${srcdir}/${_dirname}/duktape.o"
    popd > /dev/null
    popd > /dev/null
  done
}

package() {
  for _arch in ${_architectures}; do
    pushd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}" > /dev/null
    install -Dm644 "libduktape.a" "$pkgdir/usr/${_arch}/lib/libduktape.a"
    install -Dm644 "${srcdir}/${_dirname}/src/duk_config.h" "$pkgdir/usr/${_arch}/include/duk_config.h"
    install -Dm644 "${srcdir}/${_dirname}/src/duktape.h" "$pkgdir/usr/${_arch}/include/duktape.h"
    find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
    rm -rf "$pkgdir/usr/${_arch}/share"
    popd > /dev/null
  done
}
