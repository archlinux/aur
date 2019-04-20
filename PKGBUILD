# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname='python-pyarrow'
pkgver=0.13.0
pkgrel=1
pkgdesc="A columnar in-memory analytics layer for big data."
arch=('x86_64')
url="https://arrow.apache.org"
license=('Apache')
depends=('arrow')
checkdepends=('python-hypothesis' 'python-pytest')
optdepends=()
makedepends=('cmake' 'cython')
source=("https://github.com/apache/arrow/archive/apache-arrow-$pkgver.tar.gz"
  "tensorflow-abi.patch")
sha256sums=('380fcc51f0bf98e13148300c87833e734cbcd7b74dddc4bce93829e7f7e4208b'
            '3be393fc0a65dc167b1b6127da0d716d965c3e178a05eb4cdf44a92f7dcc36f4')

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
  cd "$srcdir/arrow-apache-arrow-$pkgver/python"
  py.test
}
# vim:ts=2:sw=2:et:
