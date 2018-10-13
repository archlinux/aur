# Maintainer: Andrew Sun <adsun701@gmail.com>

_pkgname=libnumbertext
pkgname=mingw-w64-${_pkgname}
pkgver=1.0.5
pkgrel=1
pkgdesc="Number to number name and money text conversion library (mingw-w64)"
arch=('any')
url="https://github.com/Numbertext/libnumbertext"
license=('LGPL3' 'custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/Numbertext/libnumbertext/archive/${pkgver}.tar.gz"
        "libnumbertext-updateautotools.patch")
sha256sums=('508f259325efc25705e27ca1bafe487aa0b8b0f5cc3bf77cb2d53ce7f119c380'
            '4c1be70cbb6c7b5e2f9d3842ad83ea95971d99663768e5df2ac74956fc4555bd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/libnumbertext-updateautotools.patch"
  autoreconf -vfi
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
