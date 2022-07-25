# Maintainer:  Albert Gräf <aggraef@gmail.com>
# Contributor: Gabriel Souza Franco <Z2FicmllbGZyYW5jb3NvdXphQGdtYWlsLmNvbQ==>
# Contributor: Florian Pritz <bluewind@xinu.at>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

# This is based on the earlier vtk6 package maintained by Gabriel Souza Franco
# which was deleted some time ago. The present package is a stripped-down
# version which compiles on current Arch and just includes the Tcl wrapper (no
# Java, no Python). It includes everything needed for Tcl-based VTK
# development, is lighter on dependencies, and builds fairly quickly.

# This package is for people who need to run legacy VTK applications which
# require a full set of VTK Tcl libraries which can be loaded straight into
# *any* (possibly embedded) instance of the Tcl interpreter. This isn't
# supported by newer VTK versions any more, which forces you to use the
# programming languages directly supported by VTK. In contrast, this package
# lets you use VTK in *any* programming environment which has a Tcl interface,
# of which there are many.

# NOTE: To prevent conflicts with other VTK installations, like the old vtk6
# package, vtk6-legacy installs into /opt/vtk6. This also encompasses the Tcl
# libraries, so in order to make the vtk package load properly in the Tcl
# interpreter, you need to set the TCLLIBPATH environment variable
# accordingly. E.g., in bash do: export TCLLIBPATH=/opt/vtk6/lib/tcltk.

# To test that the package loads properly, run tclsh and input the command
# `package require vtk`. You should see `6.3` displayed in response.

pkgname=vtk6-legacy
pkgver=6.3.0
_majorver=6.3
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization. Legacy 6.3 version, Tcl wrapper only.'
arch=('x86_64')
url='https://www.vtk.org/'
license=('BSD')
depends=('gcc-libs' 'gl2ps')
makedepends=('boost' 'cmake' 'ninja' 'doxygen' 'gnuplot' 'tk' 'wget' 'unixodbc' 'gdal' 'openmpi' 'mariadb' 'glew' 'ffmpeg' 'qt5-base' 'jsoncpp' 'qt5-webkit' 'qt5-tools')
optdepends=('tk: tcl bindings'
            'gnuplot: plotting tools'
            'graphviz: drawing tools'
            'openmpi: OpenMPI support'
            'unixodbc'
            'glew'
            'gdal'
            'mariadb')
provides=('vtk6')
conflicts=('vtk6')
source=("https://www.vtk.org/files/release/${_majorver}/VTK-${pkgver}.tar.gz"
	remove-vtkxdmf3.patch::https://github.com/Kitware/VTK/pull/21/commits/a98527dfe9ce23beebf386fab07caef99b911ede.patch
	find-libxml2.patch::https://github.com/Kitware/VTK/pull/21/commits/6216f98a7124e12a2c1cefd113347f94b51f3c51.patch
        ffmpeg3_compat.patch
        gdal2.patch
        cmake-fixes.patch)
options=(staticlibs)
sha1sums=('452efab1eedf6202f2d9a3362b5f69adfc44edda'
          '191a9393dc0e2e8c40e5042611102cd5e421dfaa'
          'c643961234e66ee94f86795f10cea2634ad046cc'
          'a78177f8dd6dedd9ad189fa12730ec53c7d02508'
          'c60610e7c8cf0ad93d7c02cbf8a20fc415f59b3e'
          '46cec3cfb4691c8f7ab42e2de963cb3362f0f13b')

prepare() {
  cd "${srcdir}"/VTK-$pkgver

  # fix compilation errors:
  patch -Np1 -i "${srcdir}"/remove-vtkxdmf3.patch
  patch -Np1 -i "${srcdir}"/find-libxml2.patch
  patch -Np1 -i "${srcdir}"/gdal2.patch
  patch -Np1 -i "${srcdir}"/ffmpeg3_compat.patch
  patch -Np1 -i "${srcdir}"/cmake-fixes.patch
}

build() {
  cd "${srcdir}"
  rm -rf build
  mkdir build
  cd build

  cmake \
    -Wno-dev \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/opt/vtk6 \
    -DBUILD_DOCUMENTATION:BOOL=OFF \
    -DBUILD_EXAMPLES:BOOL=OFF \
    -DVTK_USE_TK:BOOL=ON \
    -DVTK_WRAP_JAVA:BOOL=OFF \
    -DVTK_WRAP_PYTHON:BOOL=OFF \
    -DVTK_WRAP_TCL:BOOL=ON \
    -DVTK_Group_Tk=ON \
    -DCMAKE_CXX_FLAGS="-std=c++14 -D__STDC_CONSTANT_MACROS" \
    -DCMAKE_BUILD_TYPE=Release \
    -DModule_vtkRenderingExternal=ON \
    "${srcdir}/VTK-${pkgver}" \
    -GNinja

  ninja
}

package() {
  cd "${srcdir}/build"

  DESTDIR="${pkgdir}" ninja install

  mkdir -p "$pkgdir/etc/ld.so.conf.d/"
  printf "%s\n" "/opt/vtk6/lib" > "$pkgdir/etc/ld.so.conf.d/vtk6.conf"

  # install license file
  install -dv "${pkgdir}/opt/vtk6/share/licenses/vtk"
  install -m644 "${srcdir}/VTK-${pkgver}/Copyright.txt" "${pkgdir}/opt/vtk6/share/licenses/vtk"
}
