# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: xantares <xantares09@hotmail.com>
pkgbase=cgal-swig-bindings
pkgname=(python-cgal java-cgal)
pkgver=6.0.1.post202410241521
pkgrel=1
pkgdesc="CGAL bindings using SWIG"
arch=(x86_64)
license=(GPL-3.0-or-later)
url="https://github.com/CGAL/${pkgbase}"
makedepends=(cgal cmake swig eigen python-numpy jdk-openjdk onetbb boost)
source=(${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7840d88af155329b811d8d265c425816dcd76c13ddd069cb9592a7555ee3dd681ff2679697d7170dbfa6b3129c044ed63ab03d3ee934010695be35f4b213bbae')

build() {
  cmake \
    -S ${pkgbase} \
    -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_JAVA=ON \
    -DBUILD_PYTHON=ON \
    -DBUILD_RUBY=OFF

  cmake --build build --target all
  ctest -j2 -R python -E polyline_simplification_2 --output-on-failure
}

package_python-cgal() {
  depends=(python-numpy boost onetbb)

  cd build
  python_dir=$(python -c "from distutils import sysconfig; print(sysconfig.get_python_lib())")
  install -d "$pkgdir"/${python_dir}
  cp -r build-python/CGAL "$pkgdir"/${python_dir}
  rm "$pkgdir"/${python_dir}/CGAL/CGAL_*PYTHON_wrap.cxx
  # make DESTDIR="$pkgdir" install
}

package_java-cgal() {
  depends=(jdk-openjdk boost onetbb)

  cd build
  install -d "$pkgdir"/usr/share/java/
  cp -r build-java/CGAL "$pkgdir"/usr/share/java
  #   make DESTDIR="$pkgdir" install
}
