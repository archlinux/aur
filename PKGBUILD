# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pyname=xgboost
pkgname=python-$_pyname
pkgver=2.1.1
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
optdepends=('apache-spark: Distributed XGBoost with PySpark' 'python-pytest')
provides=(python-$_pyname)
conflicts=(python-$_pyname-git)
source=($_pyname-$pkgver.tar.gz::https://github.com/dmlc/xgboost/archive/refs/tags/v$pkgver.tar.gz
        git+https://github.com/dmlc/dmlc-core.git)
sha256sums=('3204cc5cc3cf421c42d310cd5ef7711bf8fe7e11c34641e1f042625566a421b2'
            'SKIP')

prepare() {
  cd "$srcdir/$_pyname-$pkgver"

  # Replacing the internal DMLC core with a stable one
  rm -rf dmlc-core
  ln -sf "$srcdir/dmlc-core" \
    "$srcdir/$_pyname-$pkgver/dmlc-core"
}

build() {
  cd "$srcdir"
  cmake -B build -S $_pyname-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D USE_CXX14_IF_AVAILABLE=ON \
    -D USE_OPENMP=ON \
    -D PLUGIN_FEDERATED=ON \
    -D Protobuf_PROTOC_EXECUTABLE=/usr/bin/protoc \
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

package() {
  cd "$srcdir/$_pyname-$pkgver/python-package"
  python \
    -m installer dist/*.whl \
    --destdir="$pkgdir" \
    --compile-bytecode=2
}
