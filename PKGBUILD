# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: naelstrof <naelstrof@gmail.com>

pkgname=mingw-w64-libogg
pkgver=1.3.5
pkgrel=2
pkgdesc="Ogg bitstream and framing library (mingw-w64)"
arch=(any)
url="http://xiph.org"
license=('BSD')
makedepends=('mingw-w64-cmake' 'ninja')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=(http://downloads.xiph.org/releases/ogg/libogg-${pkgver}.tar.xz)
sha256sums=('c4d91be36fc8e54deae7575241e03f4211eb102afb3fc0775fbbc1b740016705')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"
_pkgname="${pkgname#mingw-w64-}"

prepare() {
  cd ${_pkgname}-${pkgver}
  curl -L https://github.com/xiph/ogg/pull/72.patch | patch -p1
}

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -S ${_pkgname}-${pkgver} -B build/${_arch}-static -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DBUILD_SHARED_LIBS=OFF \
      -DINSTALL_DOCS=OFF

    ${_arch}-cmake -S ${_pkgname}-${pkgver} -B build/${_arch} -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DBUILD_SHARED_LIBS=ON \
      -DINSTALL_DOCS=OFF

    cmake --build build/${_arch}-static
    cmake --build build/${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build/${_arch}-static
    DESTDIR="${pkgdir}" cmake --install build/${_arch}
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
