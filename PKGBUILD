# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: xantares <xantares09@hotmail.com>
pkgbase=cgal-swig-bindings
pkgname=('python-cgal' 'java-cgal')
pkgver=r909.f579deb
pkgrel=1
pkgdesc='CGAL bindings using SWIG '
arch=('x86_64')
license=('custom: Boost')
url="https://github.com/CGAL/${pkgbase}"
makedepends=('cgal' 'cmake' 'swig' 'eigen' 'python-numpy' 'jdk-openjdk' 'tbb' 'boost' 'git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgbase}"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_JAVA=ON \
    -DBUILD_PYTHON=ON \
    -DBUILD_RUBY=OFF \
    ..
  make
  ctest -j2 -R python -E polyline_simplification_2 --output-on-failure
}

package_python-cgal() {
  depends=('python-numpy' 'boost' 'tbb')

  cd "$srcdir/${pkgbase}"/build
  python_dir=$(python -c "from distutils import sysconfig; print(sysconfig.get_python_lib())")
  install -d "$pkgdir"/${python_dir}
  cp -r build-python/CGAL "$pkgdir"/${python_dir}
  rm "$pkgdir"/${python_dir}/CGAL/CGAL_*PYTHON_wrap.cxx
  #   make DESTDIR="$pkgdir" install
}

package_java-cgal() {
  depends=('jdk-openjdk' 'boost' 'tbb')

  cd "$srcdir/${pkgbase}"/build
  install -d "$pkgdir"/usr/share/java/
  cp -r build-java/CGAL "$pkgdir"/usr/share/java
  #   make DESTDIR="$pkgdir" install
}
