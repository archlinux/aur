# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-pyarrow'
pkgver=0.10.0
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('arrow' 'jemalloc' 'parquet-cpp')
checkdepends=('python-pytest')
optdepends=()
makedepends=('cmake' 'cython')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz")
sha256sums=('2094cc6492e77ede19937375769de105603a50440a6257fefd4038f1176a0626')

build(){
  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
  ARROW_HOME=/usr PARQUET_HOME=/usr \
    python setup.py build_ext --build-type=release \
    --with-parquet --with-plasma --with-orc --inplace
}

package(){
  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
  ARROW_HOME=/usr PARQUET_HOME=/usr \
  python setup.py build_ext --build-type=release \
  --with-parquet install --root=$pkgdir
  rm $pkgdir/usr/bin/plasma_store #already installed by the arrow package
}

check(){
  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
  py.test
}
# vim:ts=2:sw=2:et:
