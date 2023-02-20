# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pkgname=xgboost
pkgname=python-$_pkgname
pkgver=1.7.4
_dmlc_ver=0.5
pkgrel=1
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
source=($_pkgname-$pkgver.tar.gz::"https://github.com/dmlc/xgboost/archive/refs/tags/v$pkgver.tar.gz"
        dmlc-core-$_dmlc_ver.tar.gz::"https://github.com/dmlc/dmlc-core/archive/refs/tags/v$_dmlc_ver.tar.gz")
sha256sums=('bedf9b61564c80f28a7ca8e74d71357539b6c81a0e5a548db10a48530a07424a'
            'cd97475ae1ecf561a1cb1129552f9889d52b11b3beb4c56e5345d007d5020ece')

prepare() {
  mkdir -p "$srcdir/build"
  rm -rf "$srcdir/$_pkgname-$pkgver/dmlc-core"
  ln -sf "$srcdir/dmlc-core-$_dmlc_ver" \
    "$srcdir/$_pkgname-$pkgver/dmlc-core"
}

build() {
  cd "$srcdir/build"
  cmake ../$_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPLUGIN_DENSE_PARSER=ON \
    -DPLUGIN_FEDERATED=ON \
    -DUSE_OPENMP=ON
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/python-package"
  python setup.py install \
    --prefix=/usr \
    --root="$pkgdir" \
    --optimize=1
}
