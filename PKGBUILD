# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pyname=xgboost
pkgname=python-$_pyname
pkgver=1.7.6
_dmlc_ver=0.5
pkgrel=2
pkgdesc="Gradient Boosting Library for Python"
arch=(x86_64 aarch64)
url="https://xgboost.ai"
license=(Apache)
depends=(python-scikit-learn python-pandas python-matplotlib python-pyarrow
         openmpi)
makedepends=(python-build python-installer python-setuptools python-wheel
             cmake)
optdepends=('apache-spark: Distributed XGBoost with PySpark' 'python-pytest')
provides=(python-$_pyname)
conflicts=(python-$_pyname-git)
source=($_pyname-$pkgver.tar.gz::https://github.com/dmlc/xgboost/archive/refs/tags/v$pkgver.tar.gz
        dmlc-core-$_dmlc_ver.tar.gz::https://github.com/dmlc/dmlc-core/archive/refs/tags/v$_dmlc_ver.tar.gz
        rabit_mpi.patch)
sha256sums=('20acbdc04e5c724884788a51abbc400fc0d8497ae6cb5b404fef4e0d32fe1a0e'
            'cd97475ae1ecf561a1cb1129552f9889d52b11b3beb4c56e5345d007d5020ece'
            '15ad5794d9f11fe43200a3663469bcaca7fd0a87c0d5c8ea41a665bf881c2b15')

prepare() {
  cd "$srcdir/$_pyname-$pkgver"

  # Replacing internal DMLC core with a stable one
  rm -rf dmlc-core
  ln -sf "$srcdir/dmlc-core-$_dmlc_ver" \
    "$srcdir/$_pyname-$pkgver/dmlc-core"

  patch -p0 < ../rabit_mpi.patch
}

build() {
  cd "$srcdir"
  cmake -B build -S $_pyname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_CXX14_IF_AVAILABLE=ON \
    -DUSE_OPENMP=ON \
    -DPLUGIN_DENSE_PARSER=ON \
    -DPLUGIN_FEDERATED=ON \
    -DProtobuf_PROTOC_EXECUTABLE=/usr/bin/protoc \
    -DRABIT_BUILD_MPI=ON
  cmake --build build

  cd $_pyname-$pkgver/python-package
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

package() {
  cd "$srcdir/$_pyname-$pkgver/python-package"
  python -m installer dist/*.whl \
    --destdir="$pkgdir" \
    --compile-bytecode=2
}
