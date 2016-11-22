# Maintainer: Michele Mocciola <mickele>
# Contributor: Mathias Anselmann <mathias____DOT____anselmann____AT____gmail____DOT____com>
# Contributor: Stéphane Gaudreault <stephane____AT____archlinux____DOT____org>
# Contributor: Thomas Dziedzic < gostrc____AT____gmail____DOT____com >
# Contributor: Simon Zilliken <simon____AT____zilliken____DOT____name>

pkgname=paraview-salome
pkgver=5.0.1p1
_salomever=7.8.0
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK - This version is built to be linked against salome modules'
arch=('i686' 'x86_64')
url='http://www.paraview.org'
license=('custom')
depends=('qtwebkit' 'python2' 'ffmpeg' 'boost' 'expat' 'freetype2' 'hdf5' 'libjpeg' 'libxml2' 'libtheora' 'libpng' 'libtiff' 'zlib' 'protobuf' 'openmpi' 'gl2ps')
makedepends=('cmake' 'mesa' 'eigen3' 'doxygen')
optdepends=('python2-matplotlib: Needed to support equation rendering using MathText markup language' 'python2-numpy: Needed for using some filters such as "Python Calculator"')
source=("http://files.salome-platform.org/Salome/Salome${_salomever}/SALOME-${_salomever}-OPENSOURCE-DB08.tgz"
	"${pkgname}.png" "${pkgname}.desktop"
	"ffmpeg3.patch" )

options=(staticlibs)
provides=("paraview=${pkgver:0:5}")

# _installdir=/opt/${pkgname}
_installdir=/usr

prepare(){
  cd "${srcdir}"

  if [ -d build ]; then
    rm -rf build
  fi

  bsdtar -xf "${srcdir}/SALOME-${_salomever}-OPENSOURCE-DB08/PREREQUISITES/SOURCES/ParaView-5.0.1p1.tar.gz"

  cd "${srcdir}/ParaView-${pkgver}"
  patch -Np1 -i ../ffmpeg3.patch
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  local cmake_options=""

  if test "$CARCH" == x86_64; then
    cmake_options+=" -DCMAKE_CXX_FLAGS:STRING=-m64"
    cmake_options+=" -DCMAKE_C_FLAGS:STRING=-m64"
  fi

  # cmake general settings
  cmake_options+=" -DCMAKE_INSTALL_PREFIX:STRING=${_installdir}"
  cmake_options+=" -DCMAKE_BUILD_TYPE:STRING=Release"
  cmake_options+=" -DBUILD_SHARED_LIBS:BOOL=ON"
  cmake_options+=" -DBUILD_TESTING:BOOL=OFF"
  cmake_options+=" -DBUILD_EXAMPLES:BOOL=OFF"
  cmake_options+=" -DBUILD_DOCUMENTATION:BOOL=OFF"
  cmake_options+=" -DDOCUMENTATION_HTML_HELP:BOOL=ON"

  # verbose mode
  cmake_options+=" -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF"

  # mpi
  cmake_options+=" -DPARAVIEW_USE_MPI:BOOL=ON"
  cmake_options+=" -DCMAKE_C_COMPILER:STRING=/usr/bin/mpicc"
  cmake_options+=" -DCMAKE_CXX_COMPILER:STRING=/usr/bin/mpic++"

  # Paraview general settings
  cmake_options+=" -DPARAVIEW_INSTALL_DEVELOPMENT_FILES:BOOL=ON"
  cmake_options+=" -DPARAVIEW_USE_VISITBRIDGE:BOOL=ON"

  # VTK general settings
  cmake_options+=" -DVTK_USE_64BIT_IDS:BOOL=OFF"
  cmake_options+=" -DVTK_NO_PYTHON_THREADS:BOOL=OFF"
  cmake_options+=" -DVTK_REPORT_OPENGL_ERRORS:BOOL=OFF"
  cmake_options+=" -DVTK_PYTHON_FULL_THREADSAFE=ON"
  
  # Qt settings
  cmake_options+=" -DPARAVIEW_BUILD_QT_GUI:BOOL=ON"
  cmake_options+=" -DPARAVIEW_QT_VERSION=4"
  cmake_options+=" -DVTK_QT_VERSION=4"
  cmake_options+=" -DQT_HELP_GENERATOR:STRING=/usr/bin/qhelpgenerator-qt4"
  cmake_options+=" -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4"

  # Python settings
  cmake_options+=" -DPARAVIEW_ENABLE_PYTHON:BOOL=ON"
  cmake_options+=" -DPYTHON_EXECUTABLE:STRING=/usr/bin/python2"
  cmake_options+=" -DPYTHON_INCLUDE_DIR:STRING=/usr/include/python2.7"
  cmake_options+=" -DPYTHON_LIBRARY:STRING=/usr/lib/python2.7/config/libpython2.7.so"

  # Tcl/Tk settings
  # TEMPORARILY DISABLE TCL WRAPPINGS DUE TO BUG IN PARAVIEW WRAPPER UTILITY!
  # local tcl_version="8.6"
  # cmake_options+=" -DVTK_WRAP_TCL:BOOL=ON"
  # cmake_options+=" -DTCL_INCLUDE_PATH:STRING=/usr/include"
  # cmake_options+=" -DTCL_LIBRARY:STRING=/usr/lib/libtcl${tcl_version}.so"
  # cmake_options+=" -DTCL_TCLSH:STRING=/usr/bin/tclsh${tcl_version}"
  # cmake_options+=" -DTK_INCLUDE_PATH:STRING=/usr/include"
  # cmake_options+=" -DTK_LIBRARY:STRING=/usr/lib/libtk${tcl_version}.so"
  # cmake_options+=" -DTK_WISH:STRING=/usr/bin/wish${tcl_version}"
  cmake_options+=" -DVTK_WRAP_TCL:BOOL=OFF"

  # Java settings
  cmake_options+=" -DVTK_WRAP_JAVA:BOOL=OFF"

  # eigen settings
  cmake_options+=" -DEigen_DIR:PATH=/usr/include/eigen3"

  # HDF5 settings
  cmake_options+=" -DVTK_USE_SYSTEM_HDF5:BOOL=ON"
  cmake_options+=" -DHDF5_DIR:PATH=/usr/lib/hdf5_18/"
  cmake_options+=" -DHDF5_INCLUDE_DIRS:PATH=/usr/include/hdf5_18/"
  cmake_options+=" -DHDF5_C_COMPILER_EXECUTABLE:FILEPATH=/usr/bin/h5cc_18"
  cmake_options+=" -DHDF5_C_LIBRARY_hdf5:FILEPATH=/usr/lib/hdf5_18/libhdf5.so"
  cmake_options+=" -DHDF5_CXX_LIBRARY_hdf5:FILEPATH=/usr/lib/hdf5_18/libhdf5.so"
  cmake_options+=" -DHDF5_C_LIBRARY_hdf5_hl:FILEPATH=/usr/lib/hdf5_18/libhdf5_hl.so"
  cmake_options+=" -DHDF5_DIFF_EXECUTABLE:FILEPATH=/usr/bin/h5diff_18"

  # Boost settings
  cmake_options+=" -DBOOST_ROOT=/usr"

  # gl2ps settings
  cmake_options+=" -DVTK_USE_SYSTEM_GL2PS:BOOL=ON"

  # libxml2 settings
  cmake_options+=" -DVTK_USE_SYSTEM_LIBXML2:BOOL=ON"
  cmake_options+=" -DLIBXML2_INCLUDE_DIR:STRING=/usr/include/libxml2"
  cmake_options+=" -DLIBXML2_LIBRARIES:STRING=/usr/lib/libxml2.so"
  cmake_options+=" -DLIBXML2_XMLLINT_EXECUTABLE:FILEPATH=/usr/bin/xmllint"

  # expat settings
  cmake_options+=" -DVTK_USE_SYSTEM_EXPAT:BOOL=ON"
  # jpeg settings
  cmake_options+=" -DVTK_USE_SYSTEM_JPEG:BOOL=ON"
  # tiff settings
  cmake_options+=" -DVTK_USE_SYSTEM_TIFF:BOOL=ON"
  # png settings
  cmake_options+=" -DVTK_USE_SYSTEM_PNG:BOOL=ON"
  # zlib settings
  cmake_options+=" -DVTK_USE_SYSTEM_ZLIB:BOOL=ON"
  # freetype settings
  cmake_options+=" -DVTK_USE_SYSTEM_FREETYPE:BOOL=ON"
  cmake_options+=" -DFREETYPE_INCLUDE_DIRS:STRING=/usr/include/freetype2"
  cmake_options+=" -DFREETYPE_LIBRARY:STRING=/usr/lib/libfreetype.so"

  # Extra options since OCC presta to improve Paraview for Salome
  cmake_options+=" -DPARAVIEW_USE_3DGLYPH:BOOL=OFF"
  cmake_options+=" -DPARAVIEW_USE_EXTENDED_OPENFILEDIALOG:BOOL=ON"
  cmake_options+=" -DPARAVIEW_USE_TIMECONTROL_SLIDER:BOOL=ON"

  # Extra options (switch off non-used Paraview plug-ins)
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_Moments:BOOL=OFF"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_SLACTools:BOOL=OFF"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_SierraPlotTools:BOOL=OFF"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_PacMan:BOOL=OFF"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_MobileRemoteControl:BOOL=OFF"
  cmake_options+=" -DPARAVIEW_ENABLE_CATALYST:BOOL=OFF"

  # Extra options (switch on required Paraview plug-ins)
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_EyeDomeLighting:BOOL=ON"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_H5PartReader:BOOL=ON"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_PointSprite:BOOL=ON"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_SurfaceLIC:BOOL=ON"
  cmake_options+=" -DPARAVIEW_ENABLE_MATPLOTLIB:BOOL=ON"

  # use ffmpeg
  cmake_options+=" -DVTK_USE_MPEG2_ENCODER=OFF"
  cmake_options+=" -DVTK_USE_FFMPEG_ENCODER=ON"
  cmake_options+=" -DPARAVIEW_ENABLE_FFMPEG=ON"

  # let's start
  cmake -Wno-dev \
        ${cmake_options} \
	../ParaView-${pkgver}

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  #Install missing cmake file
  cp -f "${srcdir}/build/VTK/VTKTargets.cmake" "${pkgdir}${_installdir}/lib/cmake/paraview-${pkgver:0:3}"

  # refers cmake files to _installdir
  cd "${pkgdir}${_installdir}/lib/cmake/paraview-${pkgver:0:3}"
  for _FILE in `grep -Rl "${srcdir}/build/lib" * `
  do
    sed -e "s|${srcdir}/build/lib|${_installdir}/lib/paraview-${pkgver:0:3}|" -i "${_FILE}"
  done
  for _FILE in `grep -Rl "${srcdir}/build/bin" * `
  do
    sed -e "s|${srcdir}/build/bin|${_installdir}/bin|" -i "${_FILE}"
  done
  sed -e "s|${srcdir}/ParaView-${pkgver}/CMake|${_installdir}/lib/CMake|" -i ParaViewConfig.cmake

  #Install license
  install -Dm644 "${srcdir}/ParaView-${pkgver}/License_v1.2.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  #Install desktop shortcuts
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"
}
md5sums=('53c07c80009555d1ffc5e0bf13cfbf20'
         'db623002bc71a257ddfdd0c9c7b14c3f'
         'e3ba22be644f91da7018f429c3b7dd39'
         'ec32574de308796bc8086a896eb8c2f9')
