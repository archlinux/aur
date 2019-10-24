pkgname=mingw-w64-paraview56
_majordotminor=5.6
pkgver=${_majordotminor}.0
_pkgver=${pkgver}
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK (mingw-w64)'
arch=('any')
url='http://www.paraview.org'
license=('custom')
depends=('mingw-w64-qt5-xmlpatterns' 'mingw-w64-qt5-tools' 'mingw-w64-boost' 'mingw-w64-glew' 'mingw-w64-expat'  'mingw-w64-freetype2'  'mingw-w64-libjpeg'  'mingw-w64-libxml2' 'mingw-w64-libtheora' 'mingw-w64-libpng' 'mingw-w64-libtiff' 'mingw-w64-zlib' 'mingw-w64-jsoncpp' 'mingw-w64-pugixml' 'mingw-w64-hdf5' 'mingw-w64-lz4' 'mingw-w64-cgns' 'mingw-w64-netcdf-cxx-legacy' 'mingw-w64-double-conversion' 'mingw-w64-protobuf')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen' 'mingw-w64-wine' 'mingw-w64-pegtl' 'protobuf')
provides=('mingw-w64-paraview')
conflicts=('mingw-w64-paraview')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://paraview.org/files/v${_majordotminor}/ParaView-v${_pkgver}.tar.gz"
        "compile-tools.patch")
sha256sums=('cb8c4d752ad9805c74b4a08f8ae6e83402c3f11e38b274dba171b99bb6ac2460'
            'ea4211078f1e1d7d2bb999861d81fbcb0cc6176844fead431c473035e94bd4bb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/ParaView-v${_pkgver}"

  # cannot be modified upstream, see https://gitlab.kitware.com/paraview/paraview/merge_requests/1716
  patch -p1 -i "${srcdir}/compile-tools.patch"
}

build() {
  cd "${srcdir}/ParaView-v${_pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
    -DPARAVIEW_INSTALL_DEVELOPMENT_FILES=ON \
    -DPARAVIEW_ENABLE_PYTHON=OFF \
    -DPARAVIEW_ENABLE_EMBEDDED_DOCUMENTATION=OFF \
    -DPARAVIEW_USE_VTKM=OFF \
    -DVTK_USE_SYSTEM_LIBRARIES=ON \
    -DVTK_USE_SYSTEM_QTTESTING=OFF \
    -DVTK_USE_SYSTEM_XDMF2=OFF \
    -DVTK_USE_SYSTEM_GL2PS=OFF \
    -DVTK_USE_SYSTEM_LIBHARU=OFF \
    -DHDF5_ROOT=/usr/${_arch}/ ..
    WINEPATH="/usr/${_arch}/bin;${PWD}/bin" make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/ParaView-v${_pkgver}/build-${_arch}
    make install/fast DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
