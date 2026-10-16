# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-opentelemetry-exporter-prometheus
_distname=opentelemetry-exporter-prometheus
_release=1.45.1
pkgver=0.66b1
pkgrel=1
pkgdesc='Prometheus metric exporter for OpenTelemetry'
arch=('any')
url='https://github.com/open-telemetry/opentelemetry-python'
license=('Apache-2.0')
depends=(
  'python-opentelemetry-api'
  'python-opentelemetry-sdk'
  'python-prometheus_client')
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer')
checkdepends=(
  'python-asgiref'
  'python-opentelemetry-test-utils'
  'python-py-cpuinfo'
  'python-pytest'
  'python-wrapt')
source=("$pkgname-$_release.tar.gz::$url/archive/refs/tags/v$_release.tar.gz")
sha256sums=('7fa3279ff22ee1322ab9e92290d4b0547e19ce164ff3ebbbeb3fcdaf96f0f2a4')

build() {
  cd "opentelemetry-python-$_release/exporter/$_distname"
  python -m build --wheel --no-isolation
}

check() {
  cd "opentelemetry-python-$_release/exporter/$_distname"
  local _check="$srcdir/check-install"
  local _site
  rm -rf "$_check"
  python -m installer --destdir="$_check" dist/*.whl
  _site="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
  cd "$srcdir"
  PYTHONPATH="$_check$_site" python -m pytest -vv --capture=no \
    --import-mode=importlib \
    "opentelemetry-python-$_release/exporter/$_distname/tests"
}

package() {
  cd "opentelemetry-python-$_release/exporter/$_distname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
