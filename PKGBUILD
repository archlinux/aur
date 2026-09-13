# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Anton Kudelin <kudelin at proton dot me>

_pyname=pmdarima
pkgname=python-${_pyname}
pkgver=2.1.1
pkgrel=3
pkgdesc="Python's forecast::auto.arima equivalent"
arch=('x86_64' 'aarch64')
url='https://github.com/alkaline-ml/pmdarima'
license=('MIT')
depends=(
  'cython'
  'openblas'
  'python'
  'python-joblib'
  'python-numpy'
  'python-packaging'
  'python-pandas'
  'python-scikit-learn'
  'python-scipy>=1.13.0'
  'python-setuptools'
  'python-statsmodels>=0.14.5'
  'python-urllib3'
)
optdepends=(
  'python-matplotlib: plotting and visualization utilities'
  'python-pytest: bundled upstream compatibility and test helpers'
)
makedepends=(
  'meson'
  'meson-python'
  'ninja'
  'python-build'
  'python-installer'
  'python-wheel'
)
checkdepends=(
  'python-matplotlib'
  'python-pytest'
  'python-pytest-benchmark'
  'python-pytest-mpl'
)
source=(
  "${_pyname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'gasoline.csv::http://alkaline-ml.com/datasets/gasoline.csv'
)
sha256sums=(
  '4debd209df0bb4eb772015350bf16ef9b48c0ff8ff6ba497270d9007e2a02ab1'
  '59ba35cda906b1b3ab695eeecba25cbc3c145168b455dda0ae44443ae7372287'
)

build() {
  cd "${_pyname}-${pkgver}"
  GITHUB_REF="refs/tags/v${pkgver}" \
    python -m build --wheel --no-isolation
}

check() {
  local checkroot="${srcdir}/check-install"
  local site_packages
  local data_root="${srcdir}/check-data"
  local port_file="${srcdir}/check-port"
  local server_pid port test_rc=0
  rm -rf "$checkroot"
  python -m installer --destdir="$checkroot" \
    "${_pyname}-${pkgver}"/dist/*.whl
  site_packages=$(python -c 'import sysconfig; print(sysconfig.get_path("platlib"))')

  # One upstream test deliberately downloads the gasoline fixture and then
  # verifies its memory and disk-cache behavior. Serve the checksum-pinned
  # upstream fixture over loopback so that the complete test remains exercised
  # in an offline build environment; only the disposable installed test copy
  # has its endpoint redirected, never the packaged source or artifact.
  rm -rf "$data_root" "$port_file"
  install -Dm644 "$srcdir/gasoline.csv" "$data_root/gasoline.csv"
  python - "$data_root" "$port_file" <<'PY' \
    >"${srcdir}/check-http.log" 2>&1 &
from functools import partial
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
import sys

root, port_file = sys.argv[1:]
handler = partial(SimpleHTTPRequestHandler, directory=root)
server = ThreadingHTTPServer(("127.0.0.1", 0), handler)
Path(port_file).write_text(str(server.server_port), encoding="ascii")
server.serve_forever()
PY
  server_pid=$!
  for _ in {1..100}; do
    [[ -s $port_file ]] && break
    kill -0 "$server_pid" 2>/dev/null || break
    sleep 0.05
  done
  test -s "$port_file"
  port=$(<"$port_file")
  sed -i \
    "s#url = 'http://alkaline-ml.com/datasets/gasoline.csv'#url = 'http://127.0.0.1:${port}/gasoline.csv'#" \
    "$checkroot$site_packages/${_pyname}/datasets/gasoline.py"
  grep -Fqx "url = 'http://127.0.0.1:${port}/gasoline.csv'" \
    "$checkroot$site_packages/${_pyname}/datasets/gasoline.py"

  # Upstream installs its complete test tree in the wheel and tests that wheel
  # through this --pyargs surface in cibuildwheel.
  cd "$srcdir"
  MPLBACKEND=Agg PYTHONPATH="$checkroot$site_packages" \
    python -P -m pytest --showlocals --durations=20 --pyargs "${_pyname}" || \
      test_rc=$?
  kill "$server_pid" 2>/dev/null || true
  wait "$server_pid" 2>/dev/null || true
  return "$test_rc"
}

package() {
  python -m installer --compile-bytecode=1 --destdir="$pkgdir" \
    "${_pyname}-${pkgver}"/dist/*.whl
  install -Dm644 "${_pyname}-${pkgver}/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
