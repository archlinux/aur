# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: tuftedocelot <tuftedocelot@fastmail.fm>
_base=filterpy
pkgname=python-${_base}
pkgver=2.0.0
pkgrel=1
pkgdesc="Kalman filtering and optimal estimation library"
arch=('any')
url="https://github.com/rlabbe/${_base}"
license=('MIT')
depends=(
  'python'
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
source=("${_base}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4ee9dc1f231663d6c8fd68cb0893cd17af44e4a75db9fc3be4371070bd992ce3')

build() {
  cd "${_base}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  local site_packages
  local test_root="$srcdir/test-install"
  local suite="$srcdir/test-suite"
  site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

  rm -rf "$test_root" "$suite"
  python -m installer --destdir="$test_root" "${_base}-${pkgver}"/dist/*.whl
  mkdir -p "$suite"
  # Keep all upstream cases, but collect them outside the runtime package tree.
  local tests
  for tests in "${_base}-${pkgver}"/filterpy/*/tests; do
    cp -a "$tests" "$suite/$(basename "$(dirname "$tests")")"
  done
  cd "$suite"
  FILTERPY_STAGED_ROOT="$test_root" MPLBACKEND=Agg \
    PYTHONNOUSERSITE=1 PYTHONPATH="$test_root$site_packages" python -P - <<'PYTEST'
import os
from pathlib import Path
import sys

import filterpy
import pytest

staged = Path(os.environ["FILTERPY_STAGED_ROOT"]).resolve()
assert Path(filterpy.__file__).resolve().is_relative_to(staged)
result = pytest.main(["-v", "--import-mode=importlib", "."])
for name, module in tuple(sys.modules.items()):
    if name == "filterpy" or name.startswith("filterpy."):
        origin = getattr(module, "__file__", None)
        if origin:
            assert Path(origin).resolve().is_relative_to(staged), (name, origin)
raise SystemExit(result)
PYTEST
}

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
