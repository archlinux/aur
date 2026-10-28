# Maintainer: Marco Righi <marco.righi@gmail.com>
# XGBoost Python, CPU only: use upstream CPU variant metadata and build flags.

pkgname=python-xgboost-cpu-only
pkgver=3.4.1
pkgrel=1
pkgdesc='XGBoost Python bindings built from source for CPU/OpenMP, without CUDA or NCCL'
arch=('x86_64')
url='https://github.com/dmlc/xgboost'
license=('Apache-2.0')
depends=('python' 'python-numpy' 'python-scipy' 'gcc-libs' 'glibc')
makedepends=('cmake' 'ninja' 'python-build' 'python-installer' 'python-scikit-build-core' 'python-packaging' 'binutils')
optdepends=(
  'python-pandas: pandas DataFrame support'
  'python-scikit-learn: scikit-learn estimator interface'
  'python-matplotlib: plotting utilities'
  'python-graphviz: tree visualization'
  'python-pyarrow: Arrow table input'
  'python-dask: Dask integration'
  'python-distributed: Dask cluster execution'
  'python-packaging: optional Dask integration'
)
provides=("python-xgboost=${pkgver}" "python-xgboost-cpu=${pkgver}")
conflicts=('python-xgboost' 'python-xgboost-cuda' 'python-xgboost-git' 'python-xgboost-cpu-nacci')
source=("xgboost-src-${pkgver}.tar.gz::https://github.com/dmlc/xgboost/releases/download/v${pkgver}/xgboost-src-${pkgver}.tar.gz")
sha256sums=('34a5cb99a67bb98b44f204767eeeae642b65a86b2ecfca60082e4d74fd4d169a')

prepare() {
  cd "${srcdir}/xgboost"
  # Official upstream generator creates xgboost-cpu metadata and removes
  # the dependency on NCCL from the Python distribution.
  PYTHONPATH="${srcdir}/xgboost/ops/script" \
    python ops/script/pypi_variants.py --use-suffix=cpu --require-nccl-dep=na
  grep -q '^name = "xgboost-cpu"' python-package/pyproject.toml
  if grep -q 'nvidia-nccl' python-package/pyproject.toml; then
    echo 'Unexpected NCCL dependency in xgboost-cpu metadata' >&2
    return 1
  fi
}

build() {
  # Prevent absolute private source paths in C/C++ __FILE__ and debug records.
  # GCC's -ffile-prefix-map covers both macro and debug path remapping.
  local prefix_map="-ffile-prefix-map=${srcdir}=/usr/src/${pkgname}-${pkgver}"
  export CFLAGS="${CFLAGS:-} ${prefix_map}"
  export CXXFLAGS="${CXXFLAGS:-} ${prefix_map}"
  cd "${srcdir}/xgboost/python-package"
  python -m build --wheel --no-isolation \
    -Ccmake.define.USE_CUDA=OFF \
    -Ccmake.define.USE_NCCL=OFF \
    -Ccmake.define.PLUGIN_FEDERATED=OFF \
    -Ccmake.define.USE_OPENMP=ON
}

check() {
  local wheel_dir="${srcdir}/wheel-check-xgboost"
  install -d "$wheel_dir"
  python -m zipfile -e "${srcdir}/xgboost/python-package/dist/"*.whl "$wheel_dir"
  PYTHONPATH="$wheel_dir" python - <<'PY'
import os
from pathlib import Path
import numpy as np
import xgboost as xgb

root = Path(os.environ['PYTHONPATH']).resolve()
assert Path(xgb.__file__).resolve().is_relative_to(root)
assert xgb.__version__ == '3.4.1'
X = np.array([[0,0], [1,0], [0,1], [1,1], [2,0], [0,2], [2,2], [3,3]], dtype=float)
y = np.array([0, 0, 0, 1, 1, 1, 1, 1])
model = xgb.train({'objective': 'binary:logistic', 'tree_method': 'hist',
                   'device': 'cpu', 'nthread': 1},
                  xgb.DMatrix(X, label=y), num_boost_round=3)
assert np.isfinite(model.predict(xgb.DMatrix(X))).all()
print('XGBoost CPU smoke test: PASS')
PY
  local shared_library
  shared_library="$(find "$wheel_dir/xgboost" -name 'libxgboost.so' -print -quit)"
  test -n "$shared_library"
  if readelf -d "$shared_library" | grep -Ei '(NEEDED.*(cuda|cublas|nccl))'; then
    echo 'Unexpected GPU dependency in CPU-only XGBoost build' >&2
    return 1
  fi
}

package() {
  cd "${srcdir}/xgboost/python-package"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  # Upstream's test suite is not part of the runtime Python library.
  local site_packages
  site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  if [[ -d "${pkgdir}${site_packages}/xgboost/testing" ]]; then
    rm -r -- "${pkgdir}${site_packages}/xgboost/testing"
  fi
  # Apache-2.0 is a shared SPDX license, but retain upstream license text.
  if [[ -f "${srcdir}/xgboost/LICENSE" ]]; then
    install -Dm644 "${srcdir}/xgboost/LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
