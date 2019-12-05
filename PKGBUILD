pkgbase=cgal-swig-bindings
pkgname=('python-cgal' 'java-cgal')
pkgver=r621.a04a496
pkgrel=1
pkgdesc='CGAL bindings using SWIG '
arch=('i686' 'x86_64')
license=('custom: Boost')
url="https://github.com/CGAL/cgal-swig-bindings"
makedepends=('cgal' 'cmake' 'swig3' 'eigen' 'python' 'java-runtime' 'git')
source=("git+https://github.com/CGAL/cgal-swig-bindings.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/cgal-swig-bindings"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "$srcdir"/cgal-swig-bindings
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DSWIG_EXECUTABLE=/usr/bin/swig-3 ..
  make
  ctest -j2 -R python -E polyline_simplification_2 --output-on-failure
}

package_python-cgal()
{
  depends=('python' 'cgal')

  cd "$srcdir"/cgal-swig-bindings/build
  python_dir=`python -c "from distutils import sysconfig; print(sysconfig.get_python_lib())"`
  install -d "$pkgdir"/${python_dir}
  cp -r build-python/CGAL "$pkgdir"/${python_dir}
  rm "$pkgdir"/${python_dir}/CGAL/CGAL_*PYTHON_wrap.cxx
#   make DESTDIR="$pkgdir" install
}

package_java-cgal()
{
  depends=('java-runtime' 'cgal')

  cd "$srcdir"/cgal-swig-bindings/build
  install -d "$pkgdir"/usr/share/java/
  cp -r build-java/CGAL "$pkgdir"/usr/share/java
#   make DESTDIR="$pkgdir" install
}
