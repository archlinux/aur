# Maintainer: Michele Mocciola <mickele>
# Contributor: Mathias Anselmann <mathias____DOT____anselmann____AT____gmail____DOT____com>
# Contributor: Stéphane Gaudreault <stephane____AT____archlinux____DOT____org>
# Contributor: Thomas Dziedzic < gostrc____AT____gmail____DOT____com >
# Contributor: Simon Zilliken <simon____AT____zilliken____DOT____name>

pkgname=paraview-salome
pkgver=4.3.1
pkgrel=1
pkgdesc='Parallel Visualization Application using VTK - This version is built to be linked against salome modules'
arch=('i686' 'x86_64')
url='http://www.paraview.org'
license=('custom')
depends=('qtwebkit' 'openmpi' 'python2' 'ffmpeg-compat' 'boost' 'libcgns-paraview' 'expat' 'freetype2' 'hdf5' 'libjpeg' 'libxml2' 'libtheora' 'libpng' 'libtiff' 'zlib' 'protobuf')
makedepends=('cmake' 'mesa' 'eigen3')
optdepends=('python2-matplotlib: Needed to support equation rendering using MathText markup language' 'python2-numpy: Needed for using some filters such as "Python Calculator"')
source=("http://paraview.org/files/v${pkgver:0:3}/ParaView-v${pkgver}-source.tar.gz" "${pkgname}.png" "${pkgname}.desktop" "patch-uint.diff" "patch-gcc49.diff")

options=(staticlibs)
provides=("paraview=${pkgver}")

# _installdir=/opt/paraview43
_installdir=/usr

prepare(){
  cd "${srcdir}/ParaView-v${pkgver}-source"

  # patch to solve uint conversion to int
  patch -Np1 -i "${srcdir}/patch-gcc49.diff"
  
  # patch to solve uint conversion to int
  patch -Np1 -i "${srcdir}/patch-uint.diff"
}

build() {
  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
  cd "${srcdir}/build"
  
  # flags to enable system libs
  local cmake_system_flags=""
  for lib in EXPAT FREETYPE HDF5 JPEG LIBXML2 PNG TIFF ZLIB; do
    cmake_system_flags+="-DVTK_USE_SYSTEM_${lib}=ON "
  done

  # flags to use python2 instead of python which is 3.x.x on archlinux
  local cmake_system_python_flags="-DPYTHON_EXECUTABLE=/usr/bin/python2 \
         -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
         -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so"

  # flags to use ffmpeg-compat instead of ffmpeg
  local ffmpeg_compat_flags="-DFFMPEG_INCLUDE_DIR=/usr/include/ffmpeg-compat \
  	 -DFFMPEG_avcodec_LIBRARY=/usr/lib/ffmpeg-compat/libavcodec.so \
  	 -DFFMPEG_avformat_LIBRARY=/usr/lib/ffmpeg-compat/libavformat.so \
  	 -DFFMPEG_avutil_LIBRARY=/usr/lib/ffmpeg-compat/libavutil.so \
  	 -DFFMPEG_swscale_LIBRARY=/usr/lib/ffmpeg-compat/libswscale.so"

  cmake -Wno-dev \
        -DCMAKE_BUILD_TYPE:STRING=Release \
        -DCMAKE_C_COMPILER=mpicc \
        -DCMAKE_CXX_COMPILER=mpicxx \
        -DCMAKE_INSTALL_PREFIX=${_installdir} \
        -DCMAKE_VERBOSE_MAKEFILE=OFF \
	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=OFF  \
	-DCMAKE_SKIP_RPATH=OFF \
	-DBUILD_SHARED_LIBS=ON \
	-DBUILD_TESTING=OFF \
	-DBUILD_EXAMPLES=ON \
	-DBUILD_DOCUMENTATION=ON \
	-DDOCUMENTATION_HTML_HELP=ON \
 	-DPARAVIEW_ENABLE_FFMPEG=ON \
        ${ffmpeg_compat_flags} \
        -DPARAVIEW_ENABLE_PYTHON=ON \
	-DPARAVIEW_ENABLE_WEB=OFF \
	-DPARAVIEW_INSTALL_DEVELOPMENT_FILES=ON \
        -DPARAVIEW_USE_MPI=ON \
        -DPARAVIEW_USE_VISITBRIDGE=ON \
	-DPARAVIEW_BUILD_PLUGIN_AdiosReader=ON \
	-DPARAVIEW_BUILD_PLUGIN_EyeDomeLighting=ON \
	-DVTK_USE_MPEG2_ENCODER=OFF \
 	-DVTK_USE_FFMPEG_ENCODER=ON \
	-DVTK_USE_64BIT_IDS=OFF \
	-DVTK_WRAP_PYTHON=ON \
	-DEigen_DIR=/usr/include/eigen3 \
        -DQT_HELP_GENERATOR=/usr/lib/qt4/bin/qhelpgenerator \
        -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
	-DVISIT_BUILD_READER_CGNS=ON \
        ${cmake_system_flags} \
        ${cmake_system_python_flags} \
        ../ParaView-v${pkgver}-source

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"

  #Install missing cmake file
  for _FILE in TopologicalSort.cmake VTKTargets.cmake
  do
    install -Dm644 `find ./ -name ${_FILE}` "${pkgdir}${_installdir}/lib/cmake/paraview-${pkgver:0:3}/"
  done

  #Install missing header
  #for _FILE in pqViewFrameActionGroup.h vtkSIVectorPropertyTemplate.h vtkMaterialInterfaceIdListItem.h vtkExodusIIReaderPrivate.h vtk3DS.h
  #do
  #  install -Dm644 `find ./ -name ${_FILE}` "${pkgdir}${_installdir}/include/paraview-${pkgver:0:3}/"
  #done

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
md5sums=('d03d3ab504037edd21306413dff64293'
         'db623002bc71a257ddfdd0c9c7b14c3f'
         'e3ba22be644f91da7018f429c3b7dd39'
         'e034fc590bd332175dcd6bf126f14d97'
         '12fa547d0c79ea6a780279712574a5fe')
