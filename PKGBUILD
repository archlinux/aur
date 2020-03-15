pkgname=vtk-git
pkgver=8.2.0.3046.g5345571164
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization'
arch=('i686' 'x86_64')
url='http://www.vtk.org'
license=('BSD')
depends=('jsoncpp' 'libxt' 'double-conversion' 'glew' 'hdf5' 'python' 'proj' 'pugixml')
makedepends=('git' 'cmake' 'doxygen' 'boost' 'java-environment' 'utf8cpp' 'eigen')
provides=("vtk")
conflicts=("vtk")
source=("git+https://gitlab.kitware.com/vtk/vtk.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/vtk"
  git describe | sed 's:^v::;s:-:.:g'
}

prepare() {
  cd "${srcdir}/vtk"
}

build() {
  cd "${srcdir}/vtk"
  export JAVA_HOME=/usr/lib/jvm/default
  mkdir -p build && cd build
  cmake $srcdir/$_pkgname \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=ON \
      -DBUILD_TESTING=OFF \
      -DVTK_LEGACY_REMOVE=ON \
      -DVTK_USE_LARGE_DATA=ON \
      -DVTK_USE_EXTERNAL=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_gl2ps=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_libharu=OFF \
      -DVTK_BUILD_TESTING=OFF \
      -DVTK_PYTHON_VERSION="3" \
      -DVTK_WRAP_JAVA=ON \
      -DVTK_WRAP_PYTHON=ON \
      -DVTK_MODULE_ENABLE_VTK_IOADIOS2=NO \
      ..
  make
}

package() {
  cd "${srcdir}/vtk/build"
  make DESTDIR="$pkgdir" install
  # Pack license
  install -D -m644 $srcdir/vtk/Copyright.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
