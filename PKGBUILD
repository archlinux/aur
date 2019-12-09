# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-pyarrow'
pkgver=0.15.1
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
sha256sums=('ab1c0d371a10b615eccfcead71bb79832245d788f4834cc6b278c03c3872d593'
            '813d8c7c55597229c330de388fdc8fa47973c5ed961ce2cad086c816ff7d4b02')

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
  ARROW_TEST_DATA="$srcdir/arrow-apache-arrow-$pkgver/testing/data" PARQUET_HOME=/usr pytest pyarrow/tests
}
# vim:ts=2:sw=2:et:
