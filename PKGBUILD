pkgname=vtk-git
pkgver=8.2.0.2155.g955aceec0f
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization'
arch=('i686' 'x86_64')
url='http://www.vtk.org'
license=('BSD')
depends=('jsoncpp' 'libxt' 'double-conversion' 'hdf5' 'python')
makedepends=('git' 'cmake' 'doxygen' 'boost' 'java-environment' 'utf8cpp')
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
  curl -L https://gitlab.kitware.com/vtk/vtk/merge_requests/5560.patch | patch -p1  
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
      -DVTK_MODULE_USE_EXTERNAL_VTK_doubleconversion=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_eigen=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_expat=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_freetype=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_gl2ps=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_glew=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_hdf5=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_jpeg=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_jsoncpp=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_libharu=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_libproj=OFF \
      -DVTK_MODULE_USE_EXTERNAL_VTK_libxml2=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_lz4=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_lzma=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_netcdf=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_png=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_sqlite=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_tiff=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_utf8=ON \
      -DVTK_MODULE_USE_EXTERNAL_VTK_zlib=ON \
      -DVTK_BUILD_TESTING=OFF \
      -DVTK_PYTHON_VERSION="3" \
      -DVTK_WRAP_JAVA=ON \
      -DVTK_WRAP_PYTHON=ON \
      ..
  make
}

package() {
  cd "${srcdir}/vtk/build"
  make DESTDIR="$pkgdir" install
  # Pack license
  install -D -m644 $srcdir/vtk/Copyright.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
