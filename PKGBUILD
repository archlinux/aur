# Maintainer: Peter Mattern <pmattern at arcor dot de>

# Notes on dependencies
# - Java: In order to discover all components needed the binary directory that's included in PATH by files
#   /etc/profile.d/jre.* of package java-runtime-common isn't sufficient but the JDK needs to be found.
#   Hence its path is set in JAVA_HOME.
# - NetCDF: System library can still be accessed via the legacy C++ API only, see
#   http://www.vtk.org/Bug/view.php?id=15549.
# - PROJ.4: System library doesn't get recognized, see http://www.vtk.org/Bug/view.php?id=14126. In tree
#   version is used which doesn't introduce problems as all relevant upstream names are changed by default.

_pkgname=vtk
pkgname=$_pkgname-git
pkgver=7.0.0.1656.gba7417a
pkgrel=1
pkgdesc='Open-source software system for image processing, 3D graphics, volume rendering and visualization'
arch=('i686' 'x86_64')
url='http://www.vtk.org'
license=('BSD')
depends=('jsoncpp' 'libxt' 'tk' 'netcdf-cxx-legacy' 'ffmpeg' 'gdal' 'gl2ps-svn')
makedepends=('git' 'cmake' 'doxygen' 'boost' 'java-environment')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/Kitware/VTK.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe | sed 's:^v::;s:-:.:g'
}

build() {
  export JAVA_HOME=/usr/lib/jvm/default
  rm -Rf build && mkdir build && cd build
  cmake $srcdir/$_pkgname \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_DOCUMENTATION=ON \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_TESTING=OFF \
      -DVTK_LEGACY_REMOVE=ON \
      -DVTK_USE_CXX11_FEATURES=ON \
      -DVTK_USE_LARGE_DATA=ON \
      -DVTK_USE_SYSTEM_LIBRARIES=ON \
      -DVTK_USE_SYSTEM_LIBPROJ4=OFF \
      -DVTK_USE_SYSTEM_XDMF3=OFF \
      -DModule_vtkIOFFMPEG=ON \
      -DModule_vtkIOGDAL=ON \
      -DModule_vtkxdmf3=ON \
      -DModule_vtkIOXdmf3=ON \
      -DVTK_WRAP_JAVA=ON \
      -DVTK_WRAP_PYTHON=ON \
      -DVTK_WRAP_TCL=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  # Place XdmfConfig.cmake of internal XDMF at a more reasonable location
  mkdir -p $pkgdir/usr/lib/cmake/XDMF && mv $pkgdir/usr/XdmfConfig.cmake $pkgdir/usr/lib/cmake/XDMF/
  # Pack license
  install -D -m644 $srcdir/$_pkgname/Copyright.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
