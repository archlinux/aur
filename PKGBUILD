# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libsystre
pkgver=1.0.1
pkgrel=1
pkgdesc="Wrapper library around TRE that provides POSIX API (mingw-w64)"
provides=('mingw-w64-regex')
arch=('any')
url=""
license=('BSD')
makedepends=('mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
depends=('mingw-w64-crt' 'mingw-w64-libtre')
options=('!strip' '!buildflags' 'staticlibs')
source=("systre-${pkgver}.tar.xz")
md5sums=('ad09e6609213a1c4ebc83a1d071a46c6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "systre-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/systre-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
    --enable-shared \
    --enable-static
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/systre-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    install -D -m644 "${srcdir}/systre-${pkgver}/COPYING" "${pkgdir}/usr/${_arch}/share/licenses/libsystre/LICENSE"
  done
}
