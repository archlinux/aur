# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=vtk
pkgname=$_pkgname-git
pkgver=7.0.0.1245.g99f5e84
pkgrel=1
pkgdesc='Open-source software system for image processing, 3D graphics, volume rendering and visualization'
arch=('i686' 'x86_64')
url='http://www.vtk.org'
license=('BSD')
depends=('gl2ps')
makedepends=('git' 'cmake' 'hdf5' 'libjpeg-turbo' 'libtiff' 'doxygen' 'java-environment' 'python' 'tk')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://gitlab.kitware.com/vtk/vtk.git")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git describe | sed 's:^v::;s:-:.:g'
}

build() {
  mkdir -p build ; cd build

  # Notes on CMake invocation
  # * Some Java components, in particular JNI, are discovered using $JAVA_HOME only.
  # * VTK doesn't get along with system-wide instances of recent NetCDF versions
  #   (http://www.vtk.org/Bug/view.php?id=15549), hence using the rather outdated
  #   (http://www.vtk.org/Bug/view.php?id=15123) version inside the VTK tree.
  # * Similarly, it doesn't seem to recognize system-wide instances of PROJ.4, neither
  #   VCS checkouts nor release 4.9.2. Thus using the in-tree version for now, too.

  export JAVA_HOME=/usr/lib/jvm/default
  cmake $srcdir/$_pkgname \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_TESTING=ON \
      -DBUILD_DOCUMENTATION=ON \
      -DVTK_LEGACY_REMOVE=ON \
      -DVTK_USE_CXX11_FEATURES=ON \
      -DVTK_USE_SYSTEM_LIBRARIES=ON \
      -DVTK_USE_SYSTEM_NETCDF=OFF \
      -DVTK_USE_SYSTEM_LIBPROJ4=OFF \
      -DVTK_USE_LARGE_DATA=ON \
      -DVTK_WRAP_PYTHON=ON \
      -DVTK_WRAP_JAVA=ON \
      -DVTK_WRAP_TCL=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -D -m644 $srcdir/$_pkgname/Copyright.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
