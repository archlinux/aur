
pkgname=mingw-w64-cgal
pkgver=4.6
pkgrel=1
arch=(any)
pkgdesc="Computational Geometry Algorithms Library (mingw-w64)"
depends=('mingw-w64-crt' 'mingw-w64-mpfr' 'mingw-w64-boost' 'mingw-w64-zlib' 'mingw-w64-qt4')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
license=('GPL', 'LGPL')
url="http://www.cgal.org"
source=("https://github.com/CGAL/cgal/archive/releases/CGAL-${pkgver}.tar.gz")
sha1sums=('3303c9cc7909b1cdc08ee86b78c3d390a1e2bad7')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare()
{
  cd "$srcdir/cgal-releases-CGAL-${pkgver}"
  sed -i "s|@CGAL_LIBRARY_INSTALLED@|CGAL|g" Installation/cmake/modules/CGALConfig_install.cmake.in
  sed -i "s|@CGAL_Core_LIBRARY_INSTALLED@|CGAL_Core|g" Installation/cmake/modules/CGALConfig_install.cmake.in
  sed -i "s|@CGAL_ImageIO_LIBRARY_INSTALLED@|CGAL_ImageIO|g" Installation/cmake/modules/CGALConfig_install.cmake.in
  sed -i "s|@CGAL_Qt4_LIBRARY_INSTALLED@|CGAL_Qt4|g" Installation/cmake/modules/CGALConfig_install.cmake.in
}

build()
{
  cd "$srcdir/cgal-releases-CGAL-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DGCC_RUN_RES=0 -DGCC_RUN_RES__TRYRUN_OUTPUT="version=4.9.2" \
      -DGMP_RUN_RES=0 -DGMP_RUN_RES__TRYRUN_OUTPUT="version=6.0.0" \
      -DMPFR_RUN_RES=0 -DMPFR_RUN_RES__TRYRUN_OUTPUT="version=3.1.2" \
      -DZLIB_RUN_RES=0 -DZLIB_RUN_RES__TRYRUN_OUTPUT="version=1.2.8" \
      -DQT4_RUN_RES=0 -DQT4_RUN_RES__TRYRUN_OUTPUT="version=4.8.6" \
      -DOPENGL_RUN_RES=0 -DOPENGL_RUN_RES__TRYRUN_OUTPUT="version=3.0.4" \
      -DCGAL_CFG_BOOST_VARIANT_SWAP_BUG=0 \
      -DCGAL_CFG_DENORMALS_COMPILE_BUG=0 \
      -DCGAL_CFG_FPU_ROUNDING_MODE_UNWINDING_VC_BUG=0 \
      -DCGAL_CFG_IEEE_754_BUG=0 \
      -DCGAL_CFG_ISTREAM_INT_BUG=0 \
      -DCGAL_CFG_MATCHING_BUG_5=0 \
      -DCGAL_CFG_MATCHING_BUG_6=0 \
      -DCGAL_CFG_MATCHING_BUG_7=0  \
      -DCGAL_CFG_MATCHING_BUG_8=0 \
      -DCGAL_CFG_NESTED_CLASS_FRIEND_DECLARATION_BUG=0 \
      -DCGAL_CFG_NO_LIMITS=0 \
      -DCGAL_CFG_NO_NEXTAFTER=0 \
      -DCGAL_CFG_NO_STL=0 \
      -DCGAL_CFG_NO_WARNING_CPP_DIRECTIVE_BUG=0 \
      -DCGAL_CFG_NUMERIC_LIMITS_BUG=0 \
      -DCGAL_CFG_OUTOFLINE_MEMBER_DEFINITION_BUG=0 \
      -DCGAL_CFG_TEMPLATE_IN_DEFAULT_PARAMETER_BUG=0 \
      -DCGAL_CFG_TYPENAME_BEFORE_DEFAULT_ARGUMENT_BUG=0 \
      -DCGAL_CFG_USING_BASE_MEMBER_BUG_2=0 \
      ..
    make
    popd
  done
}

package()
{
  for _arch in ${_architectures}; do
    cd "$srcdir/cgal-releases-CGAL-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm -rf "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
