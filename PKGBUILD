# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pkgname=xgboost
pkgname=python-$_pkgname
pkgver=1.7.5
_dmlc_ver=0.5
pkgrel=1
pkgdesc="Gradient Boosting Library for Python"
arch=(x86_64)
url="https://xgboost.ai"
license=(Apache)
depends=(python-scikit-learn python-pandas python-matplotlib python-pyarrow)
makedepends=(cmake python-setuptools)
optdepends=('apache-spark: Distributed XGBoost with PySpark' 'python-pytest')
provides=(python-$_pkgname)
conflicts=(python-$_pkgname-git)
source=($_pkgname-$pkgver.tar.gz::https://github.com/dmlc/xgboost/archive/refs/tags/v$pkgver.tar.gz
        dmlc-core-$_dmlc_ver.tar.gz::https://github.com/dmlc/dmlc-core/archive/refs/tags/v$_dmlc_ver.tar.gz)
sha256sums=('dbf57ad4f395c28f14036d1b015dc440d897de132bd93262944e312fbe91f8fe'
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
    -DUSE_CXX14_IF_AVAILABLE=ON \
    -DUSE_OPENMP=ON \
    -DPLUGIN_DENSE_PARSER=ON \
    -DPLUGIN_FEDERATED=ON \
    -DProtobuf_PROTOC_EXECUTABLE=/usr/bin/protoc \
    -DRABIT_BUILD_MPI=OFF
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/python-package"
  python setup.py install \
    --prefix=/usr \
    --root="$pkgdir" \
    --optimize=1
}
