# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-prometheus-api-client
pkgver=0.7.2
pkgrel=1
pkgdesc='Python client for the Prometheus HTTP API'
arch=('any')
url='https://github.com/4n4nd/prometheus-api-client-python'
license=('MIT')
depends=(
  'python'
  'python-dateparser'
  'python-requests'
)
optdepends=(
  'python-pandas>=1.4: metric objects and DataFrame conversions'
  'python-numpy: NumPy-formatted aggregation results'
  'python-matplotlib: metric plotting'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-httmock'
  'python-matplotlib'
  'python-numpy'
  'python-pandas'
  'python-pytest'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a295ffaa2177d8b04507ed23efa89970a4b1b6e05dfcc676aff8a95e2a9d06bc')

prepare() {
  cd "prometheus-api-client-python-${pkgver}"
  # Avoid installing upstream's generic top-level `tests` package.  The source
  # tests still run in check() against the staged wheel.
  sed -i 's/setuptools.find_packages()/setuptools.find_packages(exclude=("tests", "tests.*"))/' setup.py
}

build() {
  cd "prometheus-api-client-python-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  local site_packages
  local test_root="${srcdir}/test-install"
  site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"

  rm -rf "$test_root"
  python -m installer --destdir="$test_root" \
    "prometheus-api-client-python-${pkgver}"/dist/*.whl

  cd "$srcdir"
  PROMETHEUS_API_CLIENT_STAGED_ROOT="$test_root" \
  PYTHONPATH="$test_root$site_packages" python - <<'PY'
import os
from pathlib import Path

import prometheus_api_client
from prometheus_api_client import PrometheusConnect

root = Path(os.environ["PROMETHEUS_API_CLIENT_STAGED_ROOT"]).resolve()
assert Path(prometheus_api_client.__file__).resolve().is_relative_to(root)
assert PrometheusConnect(url="http://127.0.0.1:9090").url == "http://127.0.0.1:9090"
PY
  # Upstream's public-demo integration class needs a running Prometheus with
  # more than an hour of historical samples. Keep every bundled offline test,
  # including its mocked-network class and input-validation-only cases.
  cd "prometheus-api-client-python-${pkgver}"
  PROM_URL='http://127.0.0.1:9/' \
  MPLBACKEND=Agg PYTHONPATH="$test_root$site_packages" \
    python -m pytest -v --import-mode=importlib \
      -k 'not TestPrometheusConnect or TestPrometheusConnectWithMockedNetwork or incorrect_input_types or method_argument_accepts_get_and_post' \
      tests
}

package() {
  cd "prometheus-api-client-python-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython" \
    python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
