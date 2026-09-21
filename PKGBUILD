# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: tuftedocelot <tuftedocelot@fastmail.fm>
_base=filterpy
pkgname=python-${_base}
pkgver=1.4.5
pkgrel=3
pkgdesc="Kalman filtering and optimal estimation library"
arch=('any')
url="https://github.com/rlabbe/${_base}"
license=('MIT')
depends=(
  'python-matplotlib'
  'python-numpy'
  'python-scipy'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=(
  "${_base}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
  'ukf-ragged-array.patch::https://github.com/rlabbe/filterpy/commit/e164fc1963f95d0eada108b78a4422bfac5ce8b1.patch'
  'numpy-copy-false.patch::https://github.com/rlabbe/filterpy/commit/958146407395ecc7b813a4ba4c532e699c5c0b59.patch'
  'numpy-2.4-compat.patch'
  'numpy-2.4-test-compat.patch'
)
sha512sums=(
  '22bc58142249f32d58aa7395342f455ef97469cf26635c5551634a5e4987ad7ef559ead38a3ebacfa447927c96f6ded5d08d2273ec8e86a26288c851ca6a63e5'
  'fa0b085914e1c441229eecc5e9ac3e9cfc8338875165bb4bec204c071afe3aa25b74e1ac374d23115ae8ccdb23c0516201238c4e13a79ffafb043c55b836992a'
  'bc98125a928e55f74862c06ee29c36f40f2415be331331df2230f29634758774c395931db096b0e8a03fd33fdd3d95d809dd75cdccb96e58c2727076508d8978'
  '946aa0a5859a1e193ce2627e61cb023870a958cf91b3b4acbff98724fca52dc7bf2cb736a76edc7efe07c6fc4a575f730635840adeed90df2b35127f3bdeb0ef'
  '486fae0dc340c0414c86ab840b1b3806e4eeb0de2277f06e8d9ea8f3930a7118507cf82faf814e498c4b62242ddc4f7a37f453687ad6f5f44d97df55d34a2929'
)

prepare() {
  cd "${_base}-${pkgver}"
  # Backport upstream's list-with-None and NumPy copy-semantics fixes.
  patch -Np1 -i "$srcdir/ukf-ragged-array.patch"
  patch -Np1 -i "$srcdir/numpy-copy-false.patch"
  # NumPy 2.4 made the long-deprecated ndim>0 scalar conversion an error.
  patch -Np1 -i "$srcdir/numpy-2.4-compat.patch"
  # Preserve all upstream assertions while normalizing legacy test fixtures.
  patch -Np1 -i "$srcdir/numpy-2.4-test-compat.patch"
}

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  local site_packages
  local test_root="${srcdir}/test-install"
  site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

  rm -rf "$test_root"
  python -m installer --destdir="$test_root" \
    "${_base}-${pkgver}"/dist/*.whl

  # Run every upstream test against the staged wheel.  Agg keeps plotting tests
  # deterministic and headless without dropping any of the upstream suite.
  cd "$srcdir"
  FILTERPY_STAGED_ROOT="$test_root" \
  PYTHONPATH="$test_root$site_packages" python - <<'PY'
import os
from pathlib import Path

import filterpy

assert Path(filterpy.__file__).resolve().is_relative_to(
    Path(os.environ["FILTERPY_STAGED_ROOT"]).resolve()
)
PY
  MPLBACKEND=Agg PYTHONPATH="$test_root$site_packages" \
    python -m pytest -v --import-mode=importlib "${_base}-${pkgver}/filterpy"
}

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
