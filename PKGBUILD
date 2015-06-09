# Contributor: bubla <matej.tyc@gmail.com>
pkgname=mingw-w64-libtiff
pkgver=4.0.3
pkgrel=7
pkgdesc="Library for manipulation of TIFF images (mingw-w64)"
arch=(any)
url="http://www.remotesensing.org/libtiff"
license=("custom")
depends=(mingw-w64-libjpeg-turbo mingw-w64-zlib)
makedepends=(mingw-w64-configure)
options=(staticlibs !buildflags !strip)
source=("http://download.osgeo.org/libtiff/tiff-${pkgver}.tar.gz"
"tiff-3.9.7-CVE-2012-4447.patch"
"tiff-4.0.3-CVE-2013-1961.patch"
"libtiff-printdir-width.patch")
sha1sums=('652e97b78f1444237a82cbcfe014310e776eb6f0'
          '41be661638282dae0d07bd2788414cb6650f8981'
          '29a91870cca5d4cd9ca1c464f8074088eddc3fb8'
          '1c0a195230a69340ebd1d789bc787f6da1fafd25')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "${srcdir}/tiff-${pkgver}"
	patch -p1 -i "${srcdir}/tiff-3.9.7-CVE-2012-4447.patch"
	patch -p1 -i ${srcdir}/libtiff-printdir-width.patch
	patch -p1 -i "${srcdir}/tiff-4.0.3-CVE-2013-1961.patch"
}

build() {
  cd "${srcdir}/tiff-${pkgver}"
  for _arch in ${_architectures}; do 
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/tiff-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
