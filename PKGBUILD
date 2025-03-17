# Maintainer: redponike <proton (dot) me>

_pyname=xgboost
pkgname=python-xgboost-cuda
pkgver=3.0.0
pkgrel=1
pkgdesc="Scalable, Portable and Distributed Gradient Boosting (GBDT, GBRT or GBM) Library. Compiled with CUDA support."
arch=('x86_64')
url="https://xgboost.ai"
license=('Apache-2.0')
provides=('python-xgboost')
conflicts=('python-xgboost' 'python-xgboost-git')
depends=(
  'python-numpy'
  'python-scipy'
  'python-hypothesis'
  'cuda'
  'nccl'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
  'python-setuptools'
  'python-packaging'
  'cmake'
  'ninja'
  'git'
)
checkdepends=('python-pytest' 'python-loky')
optdepends=(
  'apache-spark: Distributed training support'
  'python-pyspark: Distributed training support with PySpark'
  'python-matplotlib: Plotting with matplotlib'
  'python-graphviz: Plotting with graphviz'
  'python-dask: Dask support - Needs python-pandas and python-distributed'
  'python-pandas: Dask support dependency'
  'python-distributed: Dask support dependency'
  'python-cloudpickle: PySpark support dependency'
  'python-scikit-learn'
  'python-pyarrow'
)
source=(
  $_pyname-$pkgver.tar.gz::https://github.com/dmlc/xgboost/archive/refs/tags/v$pkgver.tar.gz
  git+https://github.com/dmlc/dmlc-core.git#commit=13341857549852a9a86b1894b5ba84c6276ab381
  git+https://github.com/rapidsai/gputreeshap.git#commit=40eae8c4c45974705f8053e4d3d05b88e3cfaefd
)
sha256sums=('4b8775e3fcf17d9b2e7b458ca1f37a93706aa6959c2e0c64672e6e4974660f45'
            '8608303201f07bf3f7f8809e6db5bd64fbfcf964c0aceabbc4cf891271011cf7'
            '0850233f9f4433bc2af8330a5c464a2cf8c43d2e46eaab875753157a100d8039')

prepare() {
  cd "$srcdir/$_pyname-$pkgver"

  rm -rf dmlc-core
  ln -sf "$srcdir/dmlc-core" \
    "$srcdir/$_pyname-$pkgver/dmlc-core"

  rm -rf gputreeshap
  ln -sf "$srcdir/gputreeshap" \
    "$srcdir/$_pyname-$pkgver/gputreeshap"
}

build() {
  cd "$srcdir"
  cmake -B build -S $_pyname-$pkgver \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_DEPRECATED_CLI=ON \
    -D USE_CXX14_IF_AVAILABLE=ON \
    -D FORCE_COLORED_OUTPUT=ON \
    -D USE_OPENMP=ON \
    -D USE_NCCL=ON \
    -D USE_CUDA=ON \
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

  python -m pytest -v tests/python -k 'not test_rabit_ops_ipv6'

  deactivate
}

package() {
  cd "$srcdir/$_pyname-$pkgver/python-package"
  python \
    -m installer dist/*.whl \
    --destdir="$pkgdir" \
    --compile-bytecode=2
}
