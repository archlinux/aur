# Maintainer: Marco Righi <marco.righi@gmail.com>
# CPU-only build of the upstream LightGBM Python distribution.

pkgname=python-lightgbm-cpu-only
pkgver=4.7.0
pkgrel=1
pkgdesc='LightGBM Python bindings with CPU/OpenMP support, without GPU or CUDA'
arch=('x86_64')
url='https://github.com/lightgbm-org/LightGBM'
license=('MIT')
depends=('python' 'python-numpy' 'python-scipy' 'python-narwhals' 'gcc-libs' 'glibc')
makedepends=('cmake' 'ninja' 'python-build' 'python-installer' 'python-scikit-build-core' 'binutils')
optdepends=(
  'python-scikit-learn: scikit-learn estimator interface'
  'python-pandas: pandas DataFrame support'
  'python-matplotlib: plotting utilities'
  'python-graphviz: tree visualization'
  'python-dask: distributed data interfaces'
  'python-distributed: Dask distributed execution'
  'python-joblib: optional parallelism helpers'
  'python-psutil: optional system resource queries'
)
provides=("python-lightgbm=${pkgver}")
conflicts=('python-lightgbm' 'python-lightgbm-cl' 'python-lightgbm-cuda' 'python-lightgbm-nacci')
source=("https://files.pythonhosted.org/packages/source/l/lightgbm/lightgbm-${pkgver}.tar.gz")
sha256sums=('f8e20f682c9aabd000bcf4a7ed8aa6f473c1adfecccae34ec24e823d156f4af0')

build() {
  # Prevent absolute private source paths in C/C++ __FILE__ and debug records.
  # GCC's -ffile-prefix-map covers both macro and debug path remapping.
  local prefix_map="-ffile-prefix-map=${srcdir}=/usr/src/${pkgname}-${pkgver}"
  export CFLAGS="${CFLAGS:-} ${prefix_map}"
  export CXXFLAGS="${CXXFLAGS:-} ${prefix_map}"
  cd "${srcdir}/lightgbm-${pkgver}"
  python -m build --wheel --no-isolation \
    -Ccmake.define.USE_CUDA=OFF \
    -Ccmake.define.USE_GPU=OFF \
    -Ccmake.define.USE_OPENMP=ON
}

check() {
  local wheel_dir="${srcdir}/wheel-check-lightgbm"
  install -d "$wheel_dir"
  python -m zipfile -e "${srcdir}/lightgbm-${pkgver}/dist/"*.whl "$wheel_dir"
  PYTHONPATH="$wheel_dir" python - <<'PY'
import os
from pathlib import Path
import numpy as np
import lightgbm as lgb

root = Path(os.environ['PYTHONPATH']).resolve()
assert Path(lgb.__file__).resolve().is_relative_to(root)
assert lgb.__version__ == '4.7.0'
X = np.array([[0, 0], [1, 0], [0, 1], [1, 1], [2, 0], [0, 2], [2, 2], [3, 3]], dtype=float)
y = np.array([0, 0, 0, 1, 1, 1, 1, 1])
train = lgb.Dataset(X, label=y)
model = lgb.train({'objective': 'binary', 'verbosity': -1, 'num_threads': 1,
                   'min_data_in_leaf': 1}, train, num_boost_round=3)
assert np.isfinite(model.predict(X)).all()
print('LightGBM CPU smoke test: PASS')
PY
  local shared_library
  shared_library="$(find "$wheel_dir/lightgbm" -name 'lib_lightgbm.so' -print -quit)"
  test -n "$shared_library"
  if readelf -d "$shared_library" | grep -Ei '(NEEDED.*(cuda|cublas|nccl|OpenCL))'; then
    echo 'Unexpected GPU dependency in CPU-only LightGBM build' >&2
    return 1
  fi
}

package() {
  cd "${srcdir}/lightgbm-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  # LightGBM uses MIT: Arch requires the actual license text in the package.
  # Prefer the distribution's own LICENSE; fall back to wheel-installed metadata.
  local license_src=""
  local candidate
  for candidate in \
    "${srcdir}/lightgbm-${pkgver}/LICENSE" \
    "${srcdir}/lightgbm-${pkgver}/python-package/LICENSE" \
    "${srcdir}/lightgbm-${pkgver}/lightgbm/LICENSE"; do
    if [[ -f "$candidate" ]]; then
      license_src="$candidate"
      break
    fi
  done
  if [[ -z "$license_src" ]]; then
    license_src="$(find "${pkgdir}/usr/lib" -type f \
      -path '*/lightgbm-*.dist-info/licenses/LICENSE' -print -quit)"
  fi
  if [[ -z "$license_src" || ! -f "$license_src" ]]; then
    echo 'ERROR: LightGBM MIT LICENSE not found in distribution; refusing incomplete package' >&2
    return 1
  fi
  install -Dm644 "$license_src" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
