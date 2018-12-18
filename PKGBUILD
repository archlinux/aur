# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-libgeotiff
pkgver=1.4.3
pkgrel=1
pkgdesc="A TIFF based interchange format for georeferenced raster imagery (mingw-w64)"
arch=('any')
url="https://trac.osgeo.org/geotiff/"
license=('custom')
depends=('mingw-w64-libtiff' 'mingw-w64-proj' 'mingw-w64-libjpeg-turbo')
makedepends=('mingw-w64-configure')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://download.osgeo.org/geotiff/libgeotiff/libgeotiff-${pkgver}.tar.gz"
        "libgeotiff_buildsys.patch")
sha256sums=('b8510d9b968b5ee899282cdd5bef13fd02d5a4c19f664553f81e31127bc47265'
            'b158fc586ea55e5c8a1c8137eaf9a1f95c2d28709f8b550739aad9f85235bfcf')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/libgeotiff-${pkgver}
  patch -p1 -i ../libgeotiff_buildsys.patch
  
  # fix wrongly encoded files from tarball
  for f in $(find . -type f); do
    if file $f | grep -q ISO-8859 ; then
      iconv -f ISO-8859-1 -t UTF-8 $f > ${f}.tmp && \
        mv -f ${f}.tmp $f
    fi
    if file $f | grep -q CRLF ; then
      sed -i -e 's|\r$||g' $f
    fi
  done
  
  ./autogen.sh
}

build() {
  cd ${srcdir}/libgeotiff-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-proj \
      --with-jpeg \
      --with-zip \
      ..

    # FIXME: out-of-source build fails
    # cp ../*.h libxtiff
    # cp ../libxtiff/*.h libxtiff
    # cp ../*.inc bin

#     ${_arch}-cmake -DCMAKE_BUILD_TYPE=Release \
#       -DGEOTIFF_CSV_DATA_DIR=$PWD/../csv \
#       -DGEOTIFF_DATA_SUBDIR=share \
#       -DGEOTIFF_BIN_SUBDIR=bin \
#       ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libgeotiff-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    
    mkdir -p "${pkgdir}"/usr/${_arch}/lib/pkgconfig/

cat > ${pkgdir}/usr/${_arch}/lib/pkgconfig/libgeotiff.pc <<EOF
prefix=/usr/${_arch}
exec_prefix=\${prefix}
libdir=\${prefix}/lib
includedir=\${prefix}/include
Name: libgeotiff
Description: GeoTIFF file format library
Version: ${pkgver}
Libs: -L\${libdir} -lgeotiff
Cflags: -I\${includedir}
EOF
    
    rm -rf "${pkgdir}"/usr/${_arch}/share
    find "${pkgdir}/usr/${_arch}" -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
