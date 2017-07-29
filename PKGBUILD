# Contributor: bubla <matej.tyc@gmail.com>
pkgname=mingw-w64-libtiff
pkgver=4.0.8
pkgrel=2
pkgdesc="Library for manipulation of TIFF images (mingw-w64)"
arch=(any)
url="http://www.simplesystems.org/libtiff/"
license=("custom")
depends=(mingw-w64-libjpeg-turbo mingw-w64-zlib mingw-w64-xz)
makedepends=(mingw-w64-configure)
options=(staticlibs !buildflags !strip)
source=("http://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz"
"CVE-2016-10095.patch")
sha256sums=('59d7a5a8ccd92059913f246877db95a2918e6c04fb9d43fd74e5c3390dac2910'
            '36063a31e9317c3745b5e03b210c948586ea469205b06d3dde2e1b2493f18d81')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd tiff-$pkgver
  patch -p1 -i ../CVE-2016-10095.patch # Fix several security issues
}

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
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
