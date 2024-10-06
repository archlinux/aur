# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: bubla < matej dot tyc at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-libtiff
pkgver=4.7.0
pkgrel=1
pkgdesc="Library for manipulation of TIFF images (mingw-w64)"
arch=('any')
url="https://libtiff.gitlab.io/libtiff/"
license=('custom')
depends=(
  'mingw-w64-libjpeg-turbo'
  'mingw-w64-zlib'
  'mingw-w64-xz'
)
makedepends=(
  'git'
  'mingw-w64-configure'
)
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://gitlab.com/libtiff/libtiff.git?signed#tag=v${pkgver}")
b2sums=('15c36e609a96fe58ffb6123d0f99dbed22e3af532e1b2f72347b3fb37932437d85ae2e7489edb67553e3339da3742693abe2d38dcc3d8fe3c3a6df9be38ca948')
validpgpkeys=(
  'EBDFDB21B020EE8FD151A88DE301047DE1198975' # Bob Friesenhahn <bfriesen@simple.dallas.tx.us>
  'B1FA7D81EEB8E66399178B9733EBBFC47B3DD87D' # Even Rouault <even.rouault@spatialys.com>
)

prepare() {
  cd "${srcdir}/libtiff"
  autoreconf -fiv
} 

build() {
  export CFLAGS="-fno-strict-aliasing"
  export CXXFLAGS="-fno-strict-aliasing"
  cd "${srcdir}/libtiff"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-jbig \
      --without-x
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libtiff/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    cp "${srcdir}/libtiff/libtiff/"{tiffiop,tif_dir}.h "${pkgdir}/usr/${_arch}/include/"
    cp libtiff/tif_config.h "${pkgdir}/usr/${_arch}/include/"
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
