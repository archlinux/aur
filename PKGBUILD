# Maintainer: Angelo Dal Zotto <angelodalzotto97 at gmail dot com>

_pyname=xgboost
pkgname=python-$_pyname-rocm-git
pkgver=r7164.e59cb7485
pkgrel=1
pkgdesc="Gradient Boosting Library for Python (with ROCm)"
arch=(x86_64)
url='https://github.com/rocm/xgboost'
license=(Apache-2.0)
provides=('python-xgboost')
conflicts=('python-xgboost')
depends=(
  python-scikit-learn
  python-pandas
  python-matplotlib
  python-pyarrow
  python-graphviz
  python-dask
  python-hypothesis
  python-distributed
  rocm-hip-runtime
  rocm-language-runtime
  rocm-device-libs
  rocm-core
  llvm19-libs
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
  rocm-cmake
  rocm-hip-libraries
  rocm-hip-sdk
  rocm-llvm
  clang19
  doxygen
)
optdepends=(
  'apache-spark: Distributed XGBoost with PySpark'
  'python-ubjson: Enhanced JSON IO'
)
checkdepends=(
  python-pytest
  python-loky
  python-jsonschema
)
source=(
  git+https://github.com/ROCm/xgboost.git
  git+https://github.com/dmlc/dmlc-core.git
  git+https://github.com/ROCm/rocgputreeshap.git
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${_pyname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pyname"

  git submodule init
  git config submodule.dmlc-core.url "${srcdir}/dmlc-core"
  git config submodule.rocgputreeshap.url "${srcdir}/rocgputreeshap"
  git -c protocol.file.allow=always submodule update
}
    
build() {
  cd "$srcdir"

  export HIP_PATH=/opt/rocm
  export CMAKE_PREFIX_PATH=$CMAKE_PREFIX_PATH:/opt/rocm/lib/cmake:/opt/rocm/lib/cmake/AMDDeviceLibs/
  cmake -B build -S $_pyname \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_C_COMPILER=/usr/lib/llvm19/bin/clang \
    -D CMAKE_CXX_COMPILER=/usr/lib/llvm19/bin/clang++ \
    -D CMAKE_HIP_HOST_COMPILER=/usr/lib/llvm19/bin/clang++ \
    -D PLUGIN_FEDERATED=ON \
    -D USE_OPENMP=ON \
    -D USE_HIP=1 \
    -D USE_RCCL=1 \
    -D CMAKE_HIP_COMPILER_ROCM_ROOT=$($HIP_PATH/bin/hipconfig -p) \
    -D CMAKE_HIP_COMPILER=$($HIP_PATH/bin/hipconfig -l)/clang++ \
    -D BUILD_DEPRECATED_CLI=ON \
    -G Ninja \
    -W no-dev
  cmake --build build

  cd "$_pyname/python-package"
  python \
    -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd $_pyname
  rm -rf test-env
  python -m venv --system-site-packages test-env
  source test-env/bin/activate
  python -m installer python-package/dist/*.whl

  python -m pytest -v tests/python -k '
    not test_rabit_ops_ipv6 and not test_model_compatibility and not test_sklearn_model and not test_rank_assignment and not test_ops_reuse_comm and not test_adaptive and not test_stacking_regression and not test_kwargs_grid_search and not test_RFECV and not test_pandas_input and not test_estimator_reg'

  deactivate
}

package() {
  cd "$srcdir/$_pyname/python-package"
  python \
    -m installer dist/*.whl \
    --destdir="$pkgdir" \
    --compile-bytecode=2
}
