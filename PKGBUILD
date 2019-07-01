# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-pyarrow'
pkgver=0.14.0
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('arrow')
checkdepends=('git' 'python-hypothesis' 'python-pytest')
optdepends=()
makedepends=('cmake' 'cython')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz"
  "tensorflow-abi.patch")
sha256sums=('e6444a73cc7987245e0c89161e587337469d26a518c9af1e6d7dba47027e0cd1'
            '58152e9c120def968f4212c6f9c2ece71cb18d1e3b7f5fb65eddc4ba53701fd1')

prepare(){
  cd "$srcdir"
  patch -p0 < "tensorflow-abi.patch"
}

build(){
  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
  ARROW_HOME=/usr PARQUET_HOME=/usr \
    python setup.py build_ext --build-type=release \
    --with-parquet --with-plasma --with-flight --with-tensor --with-orc \
    --inplace
}

package(){
  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
  ARROW_HOME=/usr PARQUET_HOME=/usr \
  python setup.py build_ext --build-type=release \
  --with-parquet --with-plasma --with-flight --with-tensor --with-orc \
  install --root=$pkgdir
}

check(){
  cd "$srcdir/arrow-apache-arrow-$pkgver"
  git clone https://github.com/apache/arrow-testing.git testing
  cd python
  ARROW_TEST_DATA="$srcdir/arrow-apache-arrow-$pkgver/testing/data" pytest pyarrow/tests
}
# vim:ts=2:sw=2:et:
