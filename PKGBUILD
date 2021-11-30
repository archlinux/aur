#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

# og.Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# og.Maintainer: Bruno Pagani <archange at archlinux dot org>
# Contributor: Ray Rashif <schiv at archlinux dot org>
# Contributor: Andrzej Giniewicz <gginiu at gmail dot com>
# Contributor: Thomas Dziedzic <gostrc at gmail>

pkgname=vtk8
pkgver=8.2.0
pkgrel=21
provides=(vtk=$pkgver)
conflicts=(vtk)
pkgdesc="A software system for 3D computer graphics, image processing, and visualization"
arch=(x86_64)
url="https://www.vtk.org/"
license=(BSD)
depends=(gcc-libs double-conversion)
makedepends=(cmake boost doxygen ffmpeg gdal gnuplot
             java-environment openmpi python-matplotlib qt5-base
             qt5-tools qt5-webkit qt5-x11extras tk unixodbc wget
             double-conversion eigen expat freetype2 glew hdf5
             libjpeg jsoncpp libxml2 lz4 xz python-mpi4py netcdf
             libogg pdal libpng libtheora libtiff zlib
             sqlite)
optdepends=('gnuplot: plotting tools'
            'graphviz: drawing tools'
            'java-runtime: java bindings'
            'python: python bindings'
            'python-mpi4py: OpenMPI python support'
            'python-matplotlib: for Matplotlib rendering'
            'openmpi: OpenMPI support'
            'qt5-x11extras'
            'qt5-webkit: WebKit support'
            'tk: tcl bindings'
            ffmpeg
            gdal
            glew
            hdf5
            jsoncpp
            lz4
            netcdf
            pdal
            sqlite
            unixodbc)
source=("${url}/files/release/${pkgver%.*}/VTK-${pkgver}.tar.gz"
        "${url}/files/release/${pkgver%.*}/VTKData-${pkgver}.tar.gz"
        "${url}/files/release/${pkgver%.*}/VTKLargeData-${pkgver}.tar.gz"
        vtk-python-3.8.patch::"https://gitlab.kitware.com/vtk/vtk/merge_requests/5883.patch"
        vtk-gcc10.patch::"https://gitlab.kitware.com/vtk/vtk/-/commit/a9079bdc.patch"
        vtk-qt5.15.patch::"https://gitlab.kitware.com/vtk/vtk/-/commit/797f2869.patch"
        vtk-freetype-2.10.3.patch)
options=(staticlibs)
sha512sums=('521bd4dabedbc24b0e80a314a34ecd7554b04af28a7973245e3a9cf99a09b995d1b8ac42305c8e53369f226a0a6da3cdb29105ba2c90b46492736ef717760286'
            '517d0f6dfdb0c61f59df933f06d3a28c8a48ea684aaff311456213fe493e2a20128886144325fc4edfa376b2d375a2dae6c60ad6e3d5d2f4a7b0ac1d8545c87b'
            '8a7ea3d5870b1e4ccb31c77b4c270d00208349da1b2938e957210db3ec1449b678c66edc2faee1d4514aca6d725f642abc91e10ab0c151f6743cad1c53485588'
            '05a367dbb21c95f6e03e30c1c520357f60c54074d341b592de8161280c9b90e9e70c19f6b474921cc2f4d2ec17d08a2e76d7dc94c8cef111c72a241684a57b34'
            'b62127f078686f24501bc3ba2954bdcec846e7d7d1bdaf5f1b9d47ff86881035b81d6e065472228d46521a6ecafbc113adf3a8b8a97ab01a70fe88f47a971d3d'
            'ce4c8822ca4a18f0aa94991ea4df27b340e30ca38d8931cb2929c2226e8cb3a34b15c4ebe4fcb2fa5f940ab132ffe925fdef0236429face93a46d633f272c329'
            '01df3947425b510f9c64e72ab2020b02f28141421ad29be94bf118cd7b56cc22702ae329db05bc336284d3edcf3b71d254de10a2784296c691447ee356c76683')

prepare() {
  cd VTK-${pkgver}

  # Fix build with python 3.8
  patch -p1 -i ../vtk-python-3.8.patch

  # Fix build with GCC 10
  patch -d ThirdParty/exodusII/vtkexodusII -p1 -i "$srcdir"/vtk-gcc10.patch
  sed -e 's|REGEX MATCH \"\[3-9\]|REGEX MATCH \"[1-9][0-9]|' -i CMake/VTKGenerateExportHeader.cmake

  # Fix build with Qt 5.15
  patch -p1 -i ../vtk-qt5.15.patch

  # Fix build with Java 12
  sed -i 's/VTK_JAVA_SOURCE_VERSION "1.6"/VTK_JAVA_SOURCE_VERSION "1.7"/
          s/VTK_JAVA_TARGET_VERSION "1.6"/VTK_JAVA_TARGET_VERSION "1.7"/' Wrapping/Java/CMakeLists.txt

  # Fix build with FreeType 2.10.3
  patch -p1 -i ../vtk-freetype-2.10.3.patch

  # Fix build with HDF5 1.12.1
  sed -i 's/typedef int hid_t;/typedef int64_t hid_t;/' ThirdParty/xdmf3/vtkxdmf3/core/XdmfHDF5Controller.hpp
}

build() {
  # to help cmake find java
  export JAVA_HOME=/usr/lib/jvm/default

  # GL2PS blocked by http://www.vtk.org/Bug/view.php?id=16083
  # LIBHARU blocked by https://github.com/libharu/libharu/pull/157
  # exodusII,kissfft,verdict,VPIC,xdmf2/3,zfp not packaged in Arch
  # Note: VTK explicitly disables system GLEW dependency, it uses embedded sources with modifications
  local VTK_USE_SYSTEM_LIB=""
  # Common with ParaView
  for lib in DOUBLECONVERSION EIGEN EXPAT FREETYPE GLEW HDF5 JPEG JSONCPP LIBXML2 LZ4 LZMA MPI4PY NETCDF OGG PNG THEORA TIFF ZLIB; do
    VTK_USE_SYSTEM_LIB+="-DVTK_USE_SYSTEM_${lib}=ON "
  done
  for lib in SQLITE; do
    VTK_USE_SYSTEM_LIB+="-DVTK_USE_SYSTEM_${lib}=ON "
  done

  local _tkver=$(echo 'puts $tcl_version' | tclsh)

  cmake -B build -S VTK-${pkgver} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_DOCUMENTATION=OFF \
    -DDOXYGEN_KEEP_TEMP=ON \
    -DDOCUMENTATION_HTML_HELP=OFF \
    -DDOCUMENTATION_HTML_TARZ=OFF \
    -DBUILD_EXAMPLES=ON \
    -DXDMF_STATIC_AND_SHARED=OFF \
    -DVTK_USE_FFMPEG_ENCODER=ON \
    -DVTK_BUILD_ALL_MODULES=ON \
    -DModule_vtkIOPDAL=ON \
    -DVTK_USE_LARGE_DATA=ON \
    -DVTK_QT_VERSION="5" \
    -DVTK_WRAP_JAVA=ON \
    -DVTK_WRAP_PYTHON=ON \
    -DVTK_WRAP_TCL=ON \
    -DCMAKE_CXX_FLAGS="-D__STDC_CONSTANT_MACROS" \
    -DVTK_PYTHON_VERSION="3" \
    -DVTK_CUSTOM_LIBRARY_SUFFIX="" \
    -DVTK_INSTALL_INCLUDE_DIR=include/vtk \
    -DVTK_INSTALL_TCL_DIR=/usr/lib/tcl"${_tkver}"/vtk/ \
    "${VTK_USE_SYSTEM_LIB}" \
    -Wno-dev
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  # Move the vtk.jar to the arch-specific location
  install -dv "${pkgdir}"/usr/share/java/vtk
  mv -v "${pkgdir}"/usr/lib/vtk.jar "${pkgdir}"/usr/share/java/vtk
  rm -rf "${pkgdir}"/usr/lib/vtk-${pkgver%.*}/java

  # Install license
  install -Dm644 VTK-${pkgver}/Copyright.txt -t "${pkgdir}"/usr/share/licenses/${pkgname%8}/

  # Fix path of QtDesigner plugin
  install -dv "${pkgdir}"/usr/lib/qt
  mv "${pkgdir}"/usr/plugins "${pkgdir}"/usr/lib/qt/plugins
}
