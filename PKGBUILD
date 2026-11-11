# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: envolution

pkgname=python-pyloudnorm
_pkgname=pyloudnorm
pkgver=0.2.0
pkgrel=1
pkgdesc="Implementation of ITU-R BS.1770-4 loudness algorithm in Python"
arch=('any')
url="https://github.com/csteinmetz1/pyloudnorm"
license=('MIT')
depends=('python>=3.9' 'python-numpy' 'python-scipy')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-soundfile')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('99f63fc615af01cb48758e4a1c30888fc17f7bc691cc2b483975ad581e9e8b1d')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  local site staged="$srcdir/check-install"
  site=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
  rm -rf "$staged" "$srcdir/test-run"
  python -m installer --destdir="$staged" dist/*.whl
  mkdir "$srcdir/test-run"
  cp -a tests "$srcdir/test-run/"
  cd "$srcdir/test-run"
  # Both upstream test modules use the release's retained audio fixtures.
  PYTHONPATH="$staged$site" python -P -m pytest --import-mode=importlib -v tests
  PYLOUDNORM_STAGED_ROOT="$staged" PYTHONPATH="$staged$site" python -P - <<'PYTEST'
import os
from pathlib import Path
import numpy as np
import pyloudnorm as pyln

assert Path(pyln.__file__).resolve().is_relative_to(Path(os.environ['PYLOUDNORM_STAGED_ROOT']).resolve())
rate = 48000
samples = 0.1 * np.sin(2 * np.pi * 1000 * np.arange(3 * rate) / rate)
meter = pyln.Meter(rate)
measured = meter.integrated_loudness(samples)
normalized = pyln.normalize.loudness(samples, measured, -23.0)
assert np.isfinite(measured)
assert abs(meter.integrated_loudness(normalized) + 23.0) < 0.01
peak_normalized = pyln.normalize.peak(samples, -6.0)
assert np.isclose(np.max(np.abs(peak_normalized)), 10 ** (-6.0 / 20.0))
print('Installed loudness metering, loudness normalization and peak normalization: PASS')
PYTEST
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
