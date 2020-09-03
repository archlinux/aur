# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-pyarrow'
_pkgname='arrow-apache-arrow'
pkgver=1.0.1
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('arrow')
checkdepends=('git' 'python-brotli' 'python-hypothesis' 'python-pytest' 'python-pytest-lazy-fixture' 'python-pytz')
optdepends=('python-fsspec')
makedepends=('cmake' 'cython' 'python-setuptools')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz"
  "tensorflow-abi.patch")
sha256sums=('dac59f4d42416224419c020ed2e8f8371e85c1d9ff4368ed5b5c026ee28d3fd4'
            'b6efa43faf51ea69a5e60ccbfc390caaab5c898025f08db79eda76de4bfbd09e')

prepare(){
  cd "$_pkgname-$pkgver"
  patch -p1 -i ../tensorflow-abi.patch
}

build(){
  cd "$_pkgname-$pkgver/python"
  ARROW_HOME=/usr PARQUET_HOME=/usr \
    python setup.py build_ext --build-type=release \
    --with-parquet --with-plasma --with-flight --with-tensor --with-orc \
    --with-dataset \
    --inplace
}

package(){
  cd "$_pkgname-$pkgver/python"
  ARROW_HOME=/usr PARQUET_HOME=/usr \
  python setup.py build_ext --build-type=release \
  --with-parquet --with-plasma --with-flight --with-tensor --with-orc \
  install --root=$pkgdir
}

check(){
  cd "$_pkgname-$pkgver"
  git clone https://github.com/apache/arrow-testing.git testing
  cd python
  ARROW_TEST_DATA="$srcdir/arrow-apache-arrow-$pkgver/testing/data" PARQUET_HOME=/usr pytest pyarrow/tests
}
# vim:ts=2:sw=2:et:
