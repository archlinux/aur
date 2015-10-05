# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: deesy <mail@ogoethel.de>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Mathias Anselmann <mathias.anselmann@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Michele Mocciola <mickele>
# Contributor: Simon Zilliken <simon____AT____zilliken____DOT____name>

pkgname=paraview-qt5
_PkgName=ParaView
pkgver=4.4.0
pkgrel=2
pkgdesc='Parallel Visualization Application using VTK'
arch=('i686' 'x86_64')
url='http://www.paraview.org'
license=('custom')
depends=('qt5-tools' 'openmpi' 'python2'
         'ffmpeg' 'boost' 'cgns' 'jsoncpp' 'glew'
         'shared-mime-info' 'gtk-update-icon-cache')
makedepends=('cmake' 'mesa' 'gcc-fortran')
optdepends=('python2-matplotlib: Needed to support equation rendering using MathText markup language'
            'python2-numpy: Needed for using some filters such as "Python Calculator"')
source=("http://paraview.org/files/v${pkgver:0:3}/${_PkgName}-v${pkgver}-source.tar.gz"
        '0001-find_hdf5.patch')
sha256sums=('c2dc334a89df24ce5233b81b74740fc9f10bc181cd604109fd13f6ad2381fc73'
            '93fabb0b1f57322cd0bfb1fd13724c8250a40528714cd9d994a7bd5a84bc7bd8')
provides=('paraview')
conflicts=('paraview')
install=${pkgname}.install

prepare() {
  cd "${srcdir}/${_PkgName}-v${pkgver}-source"

  # Use python2
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
    -i $(find "${srcdir}/${_PkgName}-v${pkgver}-source" -name '*.py')

  # Find HDF before the check (for NetCDF)
  patch "${srcdir}/${_PkgName}-v${pkgver}-source/VTK/ThirdParty/netcdf/vtknetcdf/CMakeLists.txt" \
    "${srcdir}/0001-find_hdf5.patch"

  # Out of source build
  rm -rf -- "${srcdir}/build"
  mkdir -p -- "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"

  local vtk_system_flags=""
  for lib in EXPAT FREETYPE GLEW HDF5 JPEG JSONCPP LIBXML2 OGGTHEORA PNG TIFF ZLIB; do
    vtk_system_flags+="-DVTK_USE_SYSTEM_${lib}:BOOL=ON "
  done

  cmake \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILD_TESTING:BOOL=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DPARAVIEW_BUILD_QT_GUI:BOOL=ON \
    -DPARAVIEW_ENABLE_CGNS:BOOL=ON \
    -DPARAVIEW_ENABLE_FFMPEG:BOOL=ON \
    -DPARAVIEW_ENABLE_PYTHON:BOOL=ON \
    -DPARAVIEW_ENABLE_XDMF3:BOOL=ON \
    -DPARAVIEW_USE_MPI:BOOL=ON \
    -DPARAVIEW_USE_QTWEBKIT:BOOL=ON \
    -DPARAVIEW_USE_VISITBRIDGE:BOOL=ON \
    -DPARAVIEW_QT_VERSION=5 \
    -DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
    -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python2.7 \
    -DPYTHON_LIBRARY:PATH=/usr/lib/libpython2.7.so \
    -DPYTHON_VERSION=2 \
    -DVISIT_BUILD_READER_CGNS:BOOL=ON \
    -DVTK_RENDERING_BACKEND:STRING=OpenGL2 \
    ${vtk_system_flags} \
    -DVTK_SMP_IMPLEMENTATION_TYPE:STRING=OpenMP \
    -DVTK_QT_VERSION=5 \
    ../${_PkgName}-v${pkgver}-source


  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  # Remove unneeded file
  rm "${pkgdir}/usr/XdmfConfig.cmake"

  # Install license
  install -Dm644 "${srcdir}/${_PkgName}-v${pkgver}-source/License_v1.2.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
