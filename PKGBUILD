pkgname=paraview-qt6
pkgver=5.13.2
pkgrel=1
pkgdesc="Parallel Visualization application using VTK (Qt6 version)"
arch=(x86_64)
url="https://www.paraview.org"
license=(BSD custom)
depends=(qt6-tools qt6-svg onetbb ffmpeg
         liblas python-numpy protobuf
         cgns double-conversion expat freetype2 gdal gl2ps glew hdf5 libjpeg-turbo
         jsoncpp libjsoncpp.so libharu libxml2 lz4 xz python-mpi4py netcdf
         libogg libpng pugixml libtheora libtiff zlib verdict)
optdepends=(python-matplotlib python-pandas)
makedepends=(cmake boost mesa gcc-fortran ninja)
conflicts=(paraview)
provides=(paraview)
source=(${url}/files/v${pkgver%.*}/ParaView-v${pkgver}.tar.xz)
sha256sums=('9f544ba1a400bcca36265f0c12186ed208102470fa1a3dbbdf09d8a940fb541b')

prepare() {
  cd ParaView-v${pkgver}
  # https://gitlab.kitware.com/paraview/paraview/-/issues/22806
  patch -p1 -i ../../wl.patch
}

build() {
  cd ParaView-v${pkgver}
  cmake -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/paraview \
    -DCMAKE_INSTALL_LICENSEDIR=share/licenses/paraview \
    -DCMAKE_CXX_STANDARD=17 \
    -DPARAVIEW_IGNORE_CMAKE_CXX11_CHECKS=ON \
    -DCMAKE_SKIP_INSTALL_RPATH=OFF \
    -DPARAVIEW_ENABLE_EMBEDDED_DOCUMENTATION=OFF \
    -DPARAVIEW_PLUGIN_DISABLE_XML_DOCUMENTATION=ON \
    -DPARAVIEW_USE_VTKM=OFF \
    -DPARAVIEW_ENABLE_XDMF3=ON \
    -DPARAVIEW_VERSIONED_INSTALL=OFF \
    -DPARAVIEW_BUILD_WITH_EXTERNAL=ON \
    -DPARAVIEW_QT_VERSION=6 \
    -DVTK_QT_VERSION=6 \
    -DVTK_SMP_IMPLEMENTATION_TYPE=TBB \
    -DVTK_MODULE_USE_EXTERNAL_VTK_cli11=OFF \
    -DVTK_MODULE_USE_EXTERNAL_VTK_eigen=OFF \
    -DVTK_MODULE_USE_EXTERNAL_VTK_exprtk=OFF \
    -DVTK_MODULE_USE_EXTERNAL_VTK_fmt=OFF \
    -DVTK_MODULE_USE_EXTERNAL_VTK_fast_float=OFF \
    -DVTK_MODULE_USE_EXTERNAL_VTK_ioss=OFF \
    -DVTK_MODULE_USE_EXTERNAL_VTK_pegtl=OFF \
    -DVTK_MODULE_USE_EXTERNAL_VTK_token=OFF \
    -DVTK_MODULE_USE_EXTERNAL_VTK_utf8=OFF \
    -B build .
  ninja -C build ${MAKEFLAGS}
}

package() {
  cd ParaView-v${pkgver}
  DESTDIR="${pkgdir}" ninja -C build install
}
