# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pkgname=xgboost
pkgname=python-$_pkgname
pkgver=1.7.3
pkgrel=5
pkgdesc='Gradient Boosting Library for Python'
arch=('x86_64')
url='https://xgboost.ai'
license=('Apache')
depends=('python-scikit-learn' 'python-pandas' 'python-matplotlib'
         'python-pyarrow' 'python-pytest')
makedepends=('cmake' 'python-setuptools')
optdepends=('apache-spark: Distributed XGBoost with PySpark')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname-git")
source=($_pkgname-$pkgver.tar.gz::"https://github.com/dmlc/xgboost/releases/download/v$pkgver/$_pkgname.tar.gz")
sha256sums=('0b6aa86b93aec2b3e7ec6f53a696f8bbb23e21a03b369dc5a332c55ca57bc0c4')

prepare() {
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake ../$_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUGIN_DENSE_PARSER=ON \
    -DPLUGIN_FEDERATED=ON \
    -DDMLC_HDFS_SHARED=ON \
    -DUSE_OPENMP=ON
  make
}

package() {
  cd "$srcdir/$_pkgname/python-package"
  python setup.py install \
    --prefix=/usr \
    --root="$pkgdir" \
    --optimize=1
}
