# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-pyarrow'
_pkgname='arrow-apache-arrow'
pkgver=3.0.0
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
sha256sums=('fc461c4f0a60e7470a7c58b28e9344aa8fb0be5cc982e9658970217e084c3a82'
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
  ARROW_TEST_DATA="$srcdir/arrow-apache-arrow-$pkgver/testing/data" PARQUET_HOME=/usr pytest pyarrow/tests --deselect=pyarrow/tests/test_memory.py::test_env_var
}
# vim:ts=2:sw=2:et:
