# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Filippo Squillace <sqoox85@gmail.com>

pkgname=visit
pkgver=2.12.1
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="Interactive parallel visualization and graphical analysis tool."
arch=('i686' 'x86_64')
url="https://wci.llnl.gov/simulation/computer-codes/visit"
license=('BSD' 'custom')
makedepends=('cmake' 'java-runtime' 'gcc-fortran')
depends=('qt5-webkit' 'qt5-x11extras' 'qwt-qt5'
         'python2-numpy'
         'gperftools' 'icet' 'java-environment'
         'vtk-visit'
         'gdal' 'silo' 'cgns' 'hdf5' 'zlib')
conflicts=('visit-bin' 'visit-build')
source=("https://portal.nersc.gov/svn/${pkgname}/trunk/releases/${pkgver}/${pkgname}${pkgver}.tar.gz"
        "visit.sh"
        "visit_FindIceT.patch"
        "visit_frontendlauncher.patch")
sha256sums=('484ef1ae3b1f97571f380abe4f1ef2512663d042453838314f4c0ea6be16ba19'
            'd07a11e67ad646579fbc341f30e1eb63ebd38a5fbdd4f3ea36e8f460419028da'
            '2e7b0be6ad5bc6c0f0568b91f79149f081c2a9bded58223e4347fcf513aa206a'
            '75179bcdcc5881b12e417f402e52b14598ae2f85ea1f78702ce1dc95c9b5198f')
options=(!emptydirs)

prepare(){
  cd "${srcdir}/${pkgname}${pkgver}/src"

  # Use python2
  sed -i 's_python\*_python2.7_' CMake/FindVisItVTK.cmake
  sed -i 's/python2.7\//python2.7/g' CMake/FindVisItVTK.cmake
  sed -i 's/exec python/exec python2/g' bin/frontendlauncher
  sed -i 's/env python/env python2/' $(grep -rl "env python" ../* | xargs)

  # VTK use system libs
  sed -i 's/vtktiff/tiff/g' \
    visit_vtk/full/CMakeLists.txt
  sed -i -e 's/vtkjpeg/jpeg/g' -e 's/vtkpng/png/g' \
    engine/main/CMakeLists.txt
  sed -i -e 's/vtktiff/tiff/g' -e 's/vtkjpeg/jpeg/g' -e 's/vtkpng/png/g' \
    mdserver/main/CMakeLists.txt
  sed -i -e 's/vtkjpeg/jpeg/g' -e 's/vtkpng/png/g' \
    tools/convert/CMakeLists.txt
  sed -i -e 's/vtktiff/tiff/g' -e 's/vtkjpeg/jpeg/g' -e 's/vtkpng/png/g' \
    tools/dataserver/CMakeLists.txt
  sed -i -e 's/vtktiff/tiff/g' -e 's/vtkjpeg/jpeg/g' -e 's/vtkpng/png/g' \
    tools/mcurvit/CMakeLists.txt
  sed -i -e 's/vtktiff/tiff/g' -e 's/vtkjpeg/jpeg/g' -e 's/vtkpng/png/g' \
    tools/protocol/CMakeLists.txt
  sed -i  -e 's/vtkjpeg/jpeg/g' -e 's/vtkpng/png/g' \
    viewer/main/CMakeLists.txt

  # Proper link to all the libraries
  sed -i 's/vtkIOImage/vtkIOImage vtkIOMPIImage vtkRenderingMatplotlib vtkRenderingFreeType vtkRenderingFreeTypeFontConfig/g' \
    tools/annotations/CMakeLists.txt
  sed -i 's/vtkFiltersFlowPaths/vtkFiltersFlowPaths vtkFiltersParallelFlowPaths vtkIOMPIImage/g' \
    visit_vtk/full/CMakeLists.txt
  sed -i 's/vtkRenderingFreeTypeOpenGL/vtkRenderingFreeTypeOpenGL vtkIOMPIImage vtkRenderingMatplotlib vtkRenderingFreeTypeFontConfig/g' \
    avt/Plotter/CMakeLists.txt

  # For VTK use the libs in /opt/vtk-${_vtk_ver}/lib and fix Qt5 path
  patch bin/frontendlauncher "${srcdir}/visit_frontendlauncher.patch"

  # IceT, use the IceTConfig.cmake provided by IceT
  patch CMake/FindIceT.cmake "${srcdir}/visit_FindIceT.patch"

  # Fix Qwt include
  sed -i 's:<qwt_:<qwt/qwt_:g' \
    gui/QvisStripChart.h gui/QvisStripChart.C

  # Netcdf, does not work for now
  #sed -i 's/netcdf_c++/netcdf_c++4/g' CMake/FindNetcdf.cmake
  #sed -i 's/netcdfcpp.h/netcdf/g' databases/S3D/avtS3DFileFormat.C
  #sed -i 's/netcdfcpp.h/netcdf/g' databases/MFIXCDF/avtMFIXCDFFileFormat.h

  # R, for now Vtk in Arch is not compiled against R
  #sed -i 's/R Rblas Rlapack/Rmath/g' CMake/FindR.cmake

  # Fortran
  sed -i 's/gcc_s.1/gcc_s/g' CMake/FindGFortran.cmake

  # Out of source build
  cd "${srcdir}"
  #rm -rf -- build
  mkdir -p -- build
}

build() {
  cd "${srcdir}/build"

  _vtk_ver=$(pacman -Qi 'vtk-visit' | grep Version | cut -d: -f2 | cut -d- -f1 | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')

  cmake "${srcdir}/${pkgname}${pkgver}/src" \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/opt/${pkgname} \
    -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ \
    -DVISIT_FORTRAN:BOOL=ON -DVISIT_GFORTRAN_DIR=/usr -DCMAKE_Fortran_COMPILER=gfortran \
    -DVISIT_PARALLEL:BOOL=ON -DVISIT_MPI_COMPILER=mpicc -DVISIT_MPI_FORTRAN_COMPILER=mpifort \
    -DVISIT_CGNS_DIR:PATH=/usr \
    -DVISIT_GDAL_DIR:PATH=/usr \
    -DVISIT_HDF5_DIR:PATH=/usr \
    -DVISIT_ICET_DIR:PATH=/usr \
    -DVISIT_JAVA:BOOL=ON \
    -DVISIT_PYTHON_DIR:PATH=/usr -DVISIT_PYTHON_SKIP_INSTALL:BOOL=ON \
    -DVISIT_QT5:BOOL=ON -DVISIT_QT_DIR:PATH=/usr/lib/qt -DVISIT_QT_SKIP_INSTALL:BOOL=ON \
    -DVISIT_QWT_DIR:PATH=/usr \
    -DVISIT_SILO_DIR:PATH=/usr \
    -DVISIT_THREAD:BOOL=ON \
    -DVISIT_TCMALLOC_DIR:PATH=/usr \
    -DVISIT_VTK_DIR:PATH="/opt/vtk-${_vtk_ver}" -DVISIT_VTK_SKIP_INSTALL:BOOL=ON -DVISIT_VTK_VERSION:STRING="${_vtk_ver}"\
    -DVISIT_ZLIB_DIR:PATH=/usr

  # Does not compile for now
  #-DVISIT_NETCDF_DIR=/usr \

  # Vtk in Arch is not compiled against R
  #-DVISIT_R_DIR=/usr \
  #-DVISIT_R_SKIP_INSTALL:BOOL=ON \

  # PySide seems to be buggy
  #-DPYTHON_SUFFIX=python2.7 -DVISIT_PYSIDE_DIR=/usr \

  make
}

package(){
  cd "${srcdir}/build"

  make install DESTDIR="${pkgdir}"

  # License
  install -Dm644 "${srcdir}/${pkgname}${pkgver}/src/COPYRIGHT" \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install script to set path
  install -Dm755 "${srcdir}/visit.sh" \
    "${pkgdir}/etc/profile.d/visit.sh"
}

# vim:set ts=2 sw=2 et:
