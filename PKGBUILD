# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-isl
pkgver=0.21
pkgrel=1
pkgdesc="Library for manipulating sets and relations of integer points bounded by linear constraints (mingw-w64)"
arch=('any')
url="http://isl.gforge.inria.fr/"
license=('MIT')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-gmp')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://isl.gforge.inria.fr/isl-${pkgver}.tar.xz"
        "isl-0.14.1-no-undefined.patch")
sha256sums=('777058852a3db9500954361e294881214f6ecd4b594c00da5eee974cd6a54960'
            '83655a7202f0a0dcce1782d4b365252bf1ad12a522b7ad82ab578ee5ec46433b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/isl-${pkgver}"
  patch -p1 -i ${srcdir}/isl-0.14.1-no-undefined.patch
  autoreconf -fi
}

build() {
  cd "${srcdir}/isl-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/isl-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -f "${pkgdir}"/usr/${_arch}/lib/libisl.dll.a-gdb.py
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
