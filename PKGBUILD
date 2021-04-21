# Contributor: Andrew Sun <adsun701 at gmail dot com>

_pkgname=libnumbertext
pkgname=mingw-w64-${_pkgname}
pkgver=1.0.7
pkgrel=1
pkgdesc="Number to number name and money text conversion library (mingw-w64)"
arch=('any')
url="https://github.com/Numbertext/libnumbertext"
license=('LGPL3' 'custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/Numbertext/libnumbertext/archive/${pkgver}.tar.gz"
        "libnumbertext-updateautotools.patch")
sha256sums=('5ea8359532d7b8d7a1b63ccc7825fb3b4f8c6dcdee75cb80206d9647c50d4a03'
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
