pkgname=mingw-w64-paraview-git
pkgver=r69428.fb25e4fb9c
_pkgver=${pkgver}
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK (mingw-w64)'
arch=('any')
url='http://www.paraview.org'
license=('custom')
depends=('mingw-w64-qt5-xmlpatterns' 'mingw-w64-qt5-tools' 'mingw-w64-boost' 'mingw-w64-glew' 'mingw-w64-freetype2' 'mingw-w64-libxml2' 'mingw-w64-libtheora' 'mingw-w64-libtiff' 'mingw-w64-jsoncpp' 'mingw-w64-pugixml' 'mingw-w64-hdf5' 'mingw-w64-lz4' 'mingw-w64-cgns' 'mingw-w64-netcdf-cxx-legacy' 'mingw-w64-double-conversion')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen' 'mingw-w64-pegtl' 'mingw-w64-wine')
provides=('mingw-w64-paraview')
conflicts=('mingw-w64-paraview')
options=('!buildflags' '!strip' 'staticlibs')
source=("git+https://gitlab.kitware.com/paraview/paraview.git"
        "compile-tools.patch")
sha256sums=('SKIP'
            'ea4211078f1e1d7d2bb999861d81fbcb0cc6176844fead431c473035e94bd4bb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver () {
  cd "${srcdir}/paraview"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/paraview"
  git submodule update --init --recursive

  # cannot be modified upstream, see https://gitlab.kitware.com/paraview/paraview/merge_requests/1716
  #patch -p1 -i "${srcdir}/compile-tools.patch"
}

build() {
  cd "${srcdir}/paraview"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake --debug-output \
    -DCMAKE_RULE_MESSAGES=OFF \
    -DPARAVIEW_INSTALL_DEVELOPMENT_FILES=ON \
    -DPARAVIEW_ENABLE_PYTHON=OFF \
    -DPARAVIEW_ENABLE_EMBEDDED_DOCUMENTATION=OFF \
    -DPARAVIEW_USE_VTKM=OFF \
    -DVTK_USE_SYSTEM_LIBRARIES=ON \
    -DVTK_USE_SYSTEM_QTTESTING=OFF \
    -DVTK_USE_SYSTEM_XDMF2=OFF \
    -DVTK_USE_SYSTEM_PROTOBUF=OFF \
    -DVTK_USE_SYSTEM_GL2PS=OFF \
    -DVTK_USE_SYSTEM_LIBHARU=OFF \
    -DHDF5_ROOT=/usr/${_arch}/ .. > cmake.log 2>&1 || tail cmake.log -n 1000

    make
    popd
  done
}


package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/paraview/build-${_arch}
    make install/fast DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
