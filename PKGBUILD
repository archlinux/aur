# Maintainer: Michele Mocciola <mickele>
# Contributor: Mathias Anselmann <mathias____DOT____anselmann____AT____gmail____DOT____com>
# Contributor: Stéphane Gaudreault <stephane____AT____archlinux____DOT____org>
# Contributor: Thomas Dziedzic < gostrc____AT____gmail____DOT____com >
# Contributor: Simon Zilliken <simon____AT____zilliken____DOT____name>

pkgname=paraview-salome
pkgver=4.2.0
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK - This version is built to be linked against salome modules'
arch=('i686' 'x86_64')
url='http://www.paraview.org'
license=('custom')
depends=('qtwebkit' 'python2' 'ffmpeg-compat' 'boost' 'expat' 'freetype2' 'hdf5' 'libjpeg' 'libxml2' 'libtheora' 'libpng' 'libtiff' 'zlib' 'protobuf')
makedepends=('cmake' 'mesa' 'eigen3')
optdepends=('python2-matplotlib: Needed to support equation rendering using MathText markup language' 'python2-numpy: Needed for using some filters such as "Python Calculator"')
source=("http://paraview.org/files/v${pkgver:0:3}/ParaView-v${pkgver}-source.tar.gz" "${pkgname}.png" "${pkgname}.desktop" "uint.patch" "gcc49.patch" "ParaView-4.2.0.patch" "surface_lic.png" )

options=(staticlibs)
provides=("paraview=${pkgver}")

# _installdir=/opt/paraview43
_installdir=/usr

prepare(){
  cd "${srcdir}/ParaView-v${pkgver}-source"
  
  # patch to solve gcc49 compatiblity
  patch -Np1 -i "${srcdir}/gcc49.patch"
  
  # patch to solve uint conversion to int
  patch -Np1 -i "${srcdir}/uint.patch"

  # patch from salome-platform
  patch -Np1 -i "${srcdir}/ParaView-4.2.0.patch"

  sed -i "s%RTLD_LAZY%RTLD_LAZY|RTLD_NODELETE%g" VTK/Utilities/KWSys/vtksys/DynamicLoader.cxx

  cp -f ${srcdir}/surface_lic.png Plugins/SurfaceLIC/doc
}

build() {
  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
  cd "${srcdir}/build"
  
  local cmake_options=""

  if test "$CARCH" == x86_64; then
    cmake_options+=" -DCMAKE_CXX_FLAGS:STRING=-m64"
    cmake_options+=" -DCMAKE_C_FLAGS:STRING=-m64"
  fi

  # cmake general settings
  cmake_options+=" -DCMAKE_BUILD_TYPE:STRING=Release"
  cmake_options+=" -DCMAKE_INSTALL_PREFIX=${_installdir}"
  cmake_options+=" -DBUILD_SHARED_LIBS=ON"
  cmake_options+=" -DBUILD_TESTING=OFF"
  cmake_options+=" -DBUILD_EXAMPLES=OFF"
  cmake_options+=" -DBUILD_DOCUMENTATION=ON"
  cmake_options+=" -DDOCUMENTATION_HTML_HELP=ON"
  cmake_options+=" -DCMAKE_VERBOSE_MAKEFILE=OFF"

  # Paraview general settings
  cmake_options+=" -DPARAVIEW_INSTALL_DEVELOPMENT_FILES:BOOL=ON"

  # VTK general settings
  cmake_options+=" -DVTK_USE_64BIT_IDS:BOOL=OFF"

  # Qt settings
  cmake_options+=" -DPARAVIEW_BUILD_QT_GUI:BOOL=ON"
  cmake_options+=" -DQT_HELP_GENERATOR:STRING=/usr/bin/qhelpgenerator-qt4"
  cmake_options+=" -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4"

  # Python settings
  cmake_options+=" -DPARAVIEW_ENABLE_PYTHON:BOOL=ON"
  cmake_options+=" -DVTK_WRAP_PYTHON:BOOL=ON"
  cmake_options+=" -DPYTHON_EXECUTABLE:STRING=/usr/bin/python2"
  cmake_options+=" -DPYTHON_INCLUDE_DIR:STRING=/usr/include/python2.7"
  cmake_options+=" -DPYTHON_LIBRARY:STRING=/usr/lib/python2.7/config/libpython2.7.so"
  cmake_options+=" -DVTK_NO_PYTHON_THREADS:BOOL=OFF"

  # Tcl/Tk settings
  # TEMPORARILY DISABLE TCL WRAPPINGS DUE TO BUG IN PARAVIEW WRAPPER UTILITY!
  if false ; then
    local tcl_version = "8.6"
    cmake_options+=" -DVTK_WRAP_TCL:BOOL=ON"
    cmake_options+=" -DTCL_INCLUDE_PATH:STRING=/usr/include"
    cmake_options+=" -DTCL_LIBRARY:STRING=/usr/lib/libtcl${tcl_version}.so"
    cmake_options+=" -DTCL_TCLSH:STRING=/usr/bin/tclsh${tcl_version}"
    cmake_options+=" -DTK_INCLUDE_PATH:STRING=/usr/include"
    cmake_options+=" -DTK_LIBRARY:STRING=/usr/lib/libtk${tcl_version}.so"
    cmake_options+=" -DTK_WISH:STRING=/usr/bin/wish${tcl_version}"
  else
    cmake_options+=" -DVTK_WRAP_TCL:BOOL=OFF"
  fi

  # Java settings
  cmake_options+=" -DVTK_WRAP_JAVA:BOOL=OFF"

  # eigen settings
  cmake_options+=" -DEigen_DIR=/usr/include/eigen3"

  # MPI settings
  cmake_options+=" -DPARAVIEW_USE_MPI:BOOL=OFF"

  # HDF5 settings
  cmake_options+=" -DVTK_USE_SYSTEM_HDF5:BOOL=ON"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_H5PartReader:BOOL=OFF"

  # VisIt Database bridge settings
  cmake_options+=" -DPARAVIEW_USE_VISITBRIDGE=ON"

  # Boost settings
  cmake_options+=" -DBOOST_ROOT=/usr"

  # gl2ps settings
  cmake_options+=" -DVTK_USE_SYSTEM_GL2PS:BOOL=OFF"

  # libxml2 settings
  cmake_options+=" -DVTK_USE_SYSTEM_LIBXML2:BOOL=ON"
  cmake_options+=" -DLIBXML2_INCLUDE_DIR:STRING=/usr/include/libxml2"
  cmake_options+=" -DLIBXML2_LIBRARIES:STRING=/usr/lib/libxml2.so"

  # freetype settings
  cmake_options+=" -DVTK_USE_SYSTEM_FREETYPE:BOOL=ON"

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

  # Extra options (switch off non-used Paraview plug-ins)
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_Moments:BOOL=OFF"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_PrismPlugin:BOOL=OFF"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_SLACTools:BOOL=OFF"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_SierraPlotTools:BOOL=OFF"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_PacMan:BOOL=OFF"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_MobileRemoteControl:BOOL=OFF"
  cmake_options+=" -DPARAVIEW_ENABLE_COPROCESSING:BOOL=OFF"
  cmake_options+=" -DPARAVIEW_ENABLE_CATALYST:BOOL=OFF"

  # Extra options (switch on required Paraview plug-ins)
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_EyeDomeLighting:BOOL=ON"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_ForceTime:BOOL=ON"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_H5PartReader:BOOL=ON"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_PointSprite:BOOL=ON"
  cmake_options+=" -DPARAVIEW_BUILD_PLUGIN_SurfaceLIC:BOOL=ON"

  # use ffmpeg
  cmake_options+=" -DVTK_USE_MPEG2_ENCODER=OFF"
  cmake_options+=" -DVTK_USE_FFMPEG_ENCODER=ON"
  cmake_options+=" -DPARAVIEW_ENABLE_FFMPEG=ON"
  
  # flags to use ffmpeg-compat instead of ffmpeg
  cmake_options+=" -DFFMPEG_INCLUDE_DIR=/usr/include/ffmpeg-compat"
  cmake_options+=" -DFFMPEG_avcodec_LIBRARY=/usr/lib/ffmpeg-compat/libavcodec.so"
  cmake_options+=" -DFFMPEG_avformat_LIBRARY=/usr/lib/ffmpeg-compat/libavformat.so"
  cmake_options+=" -DFFMPEG_avutil_LIBRARY=/usr/lib/ffmpeg-compat/libavutil.so"
  cmake_options+=" -DFFMPEG_swscale_LIBRARY=/usr/lib/ffmpeg-compat/libswscale.so"

  # let's start
  cmake -Wno-dev \
        ${cmake_options} \
	../ParaView-v${pkgver}-source

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"

  #Install missing cmake file
  for _FILE in TopologicalSort.cmake
  do
    install -Dm644 `find ./ -name ${_FILE}` "${pkgdir}${_installdir}/lib/cmake/paraview-${pkgver:0:3}/"
  done

  #Install license
  install -Dm644 "${srcdir}/ParaView-v${pkgver}-source/License_v1.2.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  #Install desktop shortcuts
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  desktop-file-install --dir="${pkgdir}/usr/share/applications" "${srcdir}/${pkgname}.desktop"

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
  sed -e "s|${srcdir}/ParaView-v${pkgver}/CMake|${_installdir}/lib/CMake|" -i ParaViewConfig.cmake
}
md5sums=('77cf0e3804eb7bb91d2d94b10bd470f4'
         'db623002bc71a257ddfdd0c9c7b14c3f'
         'e3ba22be644f91da7018f429c3b7dd39'
         'e034fc590bd332175dcd6bf126f14d97'
         '12fa547d0c79ea6a780279712574a5fe'
         '3e4c48633eb337c42653f51e6112f347'
         '2f3f049a703224ca230eadffd5016455')
