# Contributor: Vaporeon <vaporeon@vaporeon.io>
# Contributor: naelstrof <naelstrof@gmail.com>

pkgname=mingw-w64-libogg
pkgver=1.3.6
pkgrel=1
pkgdesc="Ogg bitstream and framing library (mingw-w64)"
arch=(any)
url="http://xiph.org"
license=('BSD')
makedepends=('mingw-w64-cmake' 'ninja')
depends=('mingw-w64-crt')
options=('staticlibs' '!strip' '!buildflags')
source=(http://downloads.xiph.org/releases/ogg/libogg-${pkgver}.tar.xz)
sha256sums=('5c8253428e181840cd20d41f3ca16557a9cc04bad4a3d04cce84808677fa1061')

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
      -DINSTALL_DOCS=OFF -DCMAKE_POLICY_VERSION_MINIMUM=3.5

    ${_arch}-cmake -S ${_pkgname}-${pkgver} -B build/${_arch} -G Ninja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr/${_arch} \
      -DBUILD_SHARED_LIBS=ON \
      -DINSTALL_DOCS=OFF -DCMAKE_POLICY_VERSION_MINIMUM=3.5

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
