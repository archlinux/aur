pkgname=mingw-w64-paraview59
pkgver=5.9.0
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK (mingw-w64)'
arch=('any')
url='https://www.paraview.org'
license=('custom')
depends=('mingw-w64-qt5-xmlpatterns' 'mingw-w64-qt5-tools' 'mingw-w64-qt5-svg' 'mingw-w64-boost' 'mingw-w64-glew' 'mingw-w64-freetype2' 'mingw-w64-libxml2' 'mingw-w64-libtiff' 'mingw-w64-jsoncpp' 'mingw-w64-hdf5' 'mingw-w64-lz4' 'mingw-w64-proj' 'mingw-w64-cgns' 'mingw-w64-netcdf' 'mingw-w64-double-conversion' 'mingw-w64-protobuf' 'mingw-w64-libtheora' 'mingw-w64-pugixml' 'mingw-w64-gl2ps')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen' 'mingw-w64-utf8cpp' 'mingw-w64-wine' 'mingw-w64-wine-qt' 'protobuf')
provides=('mingw-w64-paraview')
conflicts=('mingw-w64-paraview')
options=('!buildflags' '!strip' 'staticlibs')
source=("${url}/files/v${pkgver:0:3}/ParaView-v${pkgver}-RC2.tar.xz"
        https://gitlab.kitware.com/vtk/vtk/-/merge_requests/7038.patch
        https://gitlab.kitware.com/paraview/catalyst/-/merge_requests/7.patch)
sha256sums=('a3e6f7db7804f11351df48781e8d67ff3e9c18a691bb9ef9a5485aa6520e70bc' SKIP SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/ParaView-v${pkgver}-RC2"
  cd VTK
  patch -p1 -i "${srcdir}"/7038.patch
  curl -L https://gitlab.kitware.com/vtk/vtk/merge_requests/7454.patch | patch -p1
  curl -L https://gitlab.kitware.com/vtk/vtk/merge_requests/7465.patch | patch -p1
  cd ../ThirdParty/catalyst/vtkcatalyst/catalyst
  patch -p1 -i "${srcdir}"/7.patch
}

build() {
  cd "${srcdir}/ParaView-v${pkgver}-RC2"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DPARAVIEW_INSTALL_DEVELOPMENT_FILES=ON \
      -DPARAVIEW_USE_PYTHON=OFF \
      -DPARAVIEW_ENABLE_EMBEDDED_DOCUMENTATION=OFF \
      -DPARAVIEW_USE_VTKM=OFF \
      -DPARAVIEW_BUILD_WITH_EXTERNAL=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_libharu=OFF \
      -Dqt_xmlpatterns_executable=/usr/bin/${_arch}-xmlpatterns \
      ..
    WINEPATH="/usr/${_arch}/bin;${PWD}/bin" make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/ParaView-v${pkgver}-RC2/build-${_arch}
    make install/fast DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
