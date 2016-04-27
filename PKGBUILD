pkgname=mingw-w64-libatomic_ops
pkgver=7.4.2
_tag=libatomic_ops-${pkgver//./_}
pkgrel=1
pkgdesc="Provides semi-portable access to hardware provided atomic memory operations (mingw-w64)"
arch=('any')
url="https://github.com/ivmai/libatomic_ops"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!strip' '!buildflags' 'staticlibs')
license=('GPL2' 'MIT')
source=("https://github.com/ivmai/libatomic_ops/archive/$_tag.zip")
sha1sums=('8f0831cac2e25ec4e87e3d71b047f7af9f46ed32')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/libatomic_ops-$_tag

  # Fix makefile preventing AO_pause undefined in libatomic_ops_gpl
  wget -c https://github.com/ivmai/libatomic_ops/commit/c63463.patch
  patch -p1 -i c63463.patch

  autoreconf -fi
}

build() {
  cd "${srcdir}"/libatomic_ops-$_tag
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libatomic_ops-$_tag/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    rm -r "${pkgdir}"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip --strip-debug "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
