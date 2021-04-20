# Contributor: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-libsigsegv
_pkgname=libsigsegv
pkgver=2.13
pkgrel=1
arch=('any')
pkgdesc="Page fault detection library (mingw-w64)"
url="http://www.gnu.org/software/libsigsegv/"
license=('GPL2')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "0001-libsigsegv-2.11-fix-assembly.patch")
sha1sums=('c371743afe08c2ec817bd6d37f32d40cb28ea5a9'
          '945d032622103b260b0397b07da8c0f5fdd78d42')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/0001-libsigsegv-2.11-fix-assembly.patch"
  autoreconf -fiv
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
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
