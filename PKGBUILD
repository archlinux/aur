# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: redponike <proton (dot) me>

pkgname=python-xgboost-cuda
pkgver=3.4.1
pkgrel=1
pkgdesc='Scalable gradient boosting library with CUDA and NCCL support'
arch=('x86_64')
url='https://xgboost.ai'
license=('Apache-2.0')
provides=("python-xgboost=$pkgver")
conflicts=('python-xgboost' 'python-xgboost-git')
depends=('python' 'python-numpy' 'python-scipy' 'cuda' 'nccl' 'gcc-libs' 'glibc')
makedepends=('git' 'cmake' 'ninja' 'gcc15' 'python-build' 'python-installer'
             'python-scikit-build-core')
checkdepends=('python-pytest' 'python-pytest-timeout' 'python-hypothesis'
              'python-loky' 'python-scikit-learn' 'python-pandas'
              'python-graphviz' 'python-pyarrow' 'python-matplotlib')
optdepends=(
  'python-scikit-learn: scikit-learn estimators and model selection'
  'python-pandas: DataFrame input and tabular cross-validation results'
  'python-dask: distributed training with Dask'
  'python-distributed: Dask distributed scheduler'
  'python-pyspark: distributed training with Spark'
  'python-cloudpickle: Spark model serialization'
  'python-matplotlib: plotting'
  'python-graphviz: tree visualization'
  'python-pyarrow: Arrow input'
)
_commit=6fe8c547bdd21c73e4555d85b087d9260595d30d
_dmlc_commit=4baa84e627849e675a3f99c92990ef9c39e4269e
source=("xgboost::git+https://github.com/dmlc/xgboost.git#commit=$_commit"
        "dmlc-core::git+https://github.com/dmlc/dmlc-core.git#commit=$_dmlc_commit"
        'cccl-quantile-scan.patch')
sha256sums=('SKIP' 'SKIP' '3fff6c1e75a1a16d8f2f8a1cf93d3fcfd07e6dc73f70bd3b9f36b30ef30adf64')

prepare() {
  cd xgboost
  git submodule init
  git config submodule.dmlc-core.url "$srcdir/dmlc-core"
  git -c protocol.file.allow=always submodule update dmlc-core
  # CCCL 3.5 needs the device scan's return type visible to the host compiler,
  # and a raw iterator avoids its reverse_iterator/device_ptr arrow mismatch.
  patch -Np1 --fuzz=0 -i "$srcdir/cccl-quantile-scan.patch"

  # Link the system NCCL declared in depends instead of requesting NVIDIA's
  # separately bundled PyPI distribution in the wheel metadata.
  sed -i '/"nvidia-nccl-cu13 ; platform_system ==/d' python-package/pyproject.toml
}

build() {
  cd xgboost
  # CUDA supports GCC 15; Arch's default compiler is newer. Keep upstream's
  # complete CUDA architecture selection, including its forward-compatible PTX.
  export CC=/usr/bin/gcc-15 CXX=/usr/bin/g++-15
  export CUDAHOSTCXX=/usr/bin/g++-15 NVCC_CCBIN=/usr/bin/g++-15
  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CUDA_HOST_COMPILER=/usr/bin/g++-15 \
    -DUSE_OPENMP=ON \
    -DUSE_CUDA=ON \
    -DUSE_NCCL=ON \
    -DBUILD_WITH_SHARED_NCCL=ON
  cmake --build build

  # The upstream wheel backend packages the library just compiled above.
  cd python-package
  python -m build --wheel --no-isolation
}

check() {
  cd xgboost
  python -m installer --destdir="$srcdir/check-install" python-package/dist/*.whl
  local site_packages
  site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"
  export PYTHONPATH="$srcdir/check-install$site_packages"
  export OMP_NUM_THREADS=4 OPENBLAS_NUM_THREADS=1

  # Retain the upstream CPU suite and the package's existing IPv6 exclusion.
  # Device tests are validated separately using an allocated GPU.
  python -m pytest -v tests/python -k 'not test_rabit_ops_ipv6'
}

package() {
  cd xgboost/python-package
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
