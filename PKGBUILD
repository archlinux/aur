# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >
# Contributor: bubla < matej dot tyc at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-libtiff
pkgver=4.0.10
pkgrel=1
pkgdesc="Library for manipulation of TIFF images (mingw-w64)"
arch=('any')
url="http://www.simplesystems.org/libtiff/"
license=('custom')
depends=('mingw-w64-libjpeg-turbo'
         'mingw-w64-zlib'
         'mingw-w64-xz')
makedepends=('mingw-w64-configure')
options=('!strip' 'staticlibs' '!buildflags')
source=("http://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz")
sha256sums=('2c52d11ccaf767457db0c46795d9c7d1a8d8f76f68b0b800a3dfe45786b996e4')

build() {
  export CFLAGS="-fno-strict-aliasing"
  export CXXFLAGS="-fno-strict-aliasing"
  cd "${srcdir}/tiff-${pkgver}"
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
    cd "${srcdir}/tiff-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    cp "${srcdir}/tiff-${pkgver}/libtiff/"{tiffiop,tif_dir}.h "${pkgdir}/usr/${_arch}/include/"
    cp libtiff/tif_config.h "${pkgdir}/usr/${_arch}/include/"
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
