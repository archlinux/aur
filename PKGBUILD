# Contributor: bubla <matej.tyc@gmail.com>
pkgname=mingw-w64-libtiff
pkgver=4.0.6
pkgrel=1
pkgdesc="Library for manipulation of TIFF images (mingw-w64)"
arch=(any)
url="http://www.remotesensing.org/libtiff"
license=("custom")
depends=(mingw-w64-libjpeg-turbo mingw-w64-zlib mingw-w64-xz)
makedepends=(mingw-w64-configure)
options=(staticlibs !buildflags !strip)
source=("http://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz")
sha1sums=('280e27704eaca5f592b82e71ac0c78b87395e2de')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
	export CFLAGS+=" -fno-strict-aliasing"
  export CXXFLAGS+=" -fno-strict-aliasing"
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
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
