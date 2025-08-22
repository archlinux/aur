# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pyname=xgboost
pkgname=python-$_pyname
pkgver=3.0.4
pkgrel=1
pkgdesc="Gradient Boosting Library for Python"
arch=(x86_64 aarch64)
url="https://xgboost.ai"
license=(Apache-2.0)
depends=(
  python-scikit-learn
  python-pandas
  python-matplotlib
  python-pyarrow
  python-graphviz
  python-dask
  python-hypothesis
  python-distributed
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-hatchling
  python-setuptools
  cmake
  ninja
  git
)
checkdepends=(
  python-pytest
  python-loky
)
optdepends=(
  'apache-spark: Distributed XGBoost with PySpark'
  'python-ubjson: Enhanced JSON IO'
)
source=($_pyname-$pkgver.tar.gz::https://github.com/dmlc/xgboost/archive/refs/tags/v$pkgver.tar.gz
        git+https://github.com/dmlc/dmlc-core.git)
sha256sums=('53dc66cea1ea6d9f23277690869858a8cca9f58299ab1ac18fed2b8b0f389730'
            'SKIP')

prepare() {
  cd "$srcdir/$_pyname-$pkgver"

  # Replacing the internal DMLC core with fresh one
  rm -rf dmlc-core
  ln -sf "$srcdir/dmlc-core" \
    "$srcdir/$_pyname-$pkgver/dmlc-core"
}

build() {
  cd "$srcdir"
  cmake -B build -S $_pyname-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D Protobuf_PROTOC_EXECUTABLE=/usr/bin/protoc \
    -D BUILD_DEPRECATED_CLI=ON \
    -D PLUGIN_FEDERATED=ON \
    -D USE_CXX14_IF_AVAILABLE=ON \
    -D USE_OPENMP=ON \
    -D USE_PARQUET=ON \
    -G Ninja \
    -W no-dev
  cmake --build build

  cd $_pyname-$pkgver/python-package
  python \
    -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd $_pyname-$pkgver

  python -m venv --system-site-packages test-env
  source test-env/bin/activate
  python -m installer python-package/dist/*.whl

  python -m pytest -v tests/python -k 'not test_training'

  deactivate
}

package() {
  cd "$srcdir/$_pyname-$pkgver/python-package"
  python \
    -m installer dist/*.whl \
    --destdir="$pkgdir" \
    --compile-bytecode=2
}
