# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-pyarrow'
pkgver=0.14.1
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
  "tensorflow-abi.patch"
  5c005fbca3dc5b5ae4cae524884894bccd1db25e.patch)
sha256sums=('69d9de9ec60a3080543b28a5334dbaf892ca34235b8bd8f8c1c01a33253926c1'
            '78fffb2ccc47b4cef1bbeff999c1b809e50e6b2245f55be7f8dda1bd3a206be7'
            'fc979177f3a2fe67a5f3e26f3efe9a540b4df447509b3802164d19d9323e39f5')

prepare(){
  cd "$srcdir"
  patch -p0 < "tensorflow-abi.patch"
  cd "arrow-apache-arrow-$pkgver"
  patch -p1 < ../5c005fbca3dc5b5ae4cae524884894bccd1db25e.patch
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
