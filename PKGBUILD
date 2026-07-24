# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=codex-lb
_pkgname=codex_lb
pkgver=1.22.0
pkgrel=1
pkgdesc='Load balancer and proxy for ChatGPT accounts with usage dashboard and OpenAI-compatible API'
arch=('any')
url='https://github.com/Soju06/codex-lb'
license=('MIT')
depends=(
  'python'
  'python-aiohttp'
  'python-aiohttp-retry'
  'python-aiohttp-socks'
  'python-aiosqlite'
  'python-alembic'
  'python-anyio'
  'python-asyncpg'
  'python-bcrypt'
  'python-brotli'
  'python-certifi'
  'python-cryptography'
  'python-dotenv'
  'python-fastapi'
  'python-greenlet'
  'python-mako'
  'python-multidict'
  'python-psycopg'
  'python-pydantic'
  'python-pydantic-settings'
  'python-pygments'
  'python-pyotp'
  'python-python-multipart'
  'python-python-socks'
  'python-segno'
  'python-sqlalchemy'
  'python-starlette'
  'python-urllib3'
  'python-websockets'
  'python-zstandard'
  'uvicorn'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
  'python-wheel'
)
optdepends=(
  'python-prometheus_client: Prometheus /metrics endpoint (metrics extra)'
  'python-opentelemetry-api: OpenTelemetry tracing (tracing extra)'
  'python-opentelemetry-sdk: OpenTelemetry tracing (tracing extra)'
  'python-opentelemetry-exporter-otlp: OTLP exporter (tracing extra)'
  'python-opentelemetry-instrumentation-fastapi: FastAPI tracing (AUR; tracing extra)'
  'python-opentelemetry-instrumentation-aiohttp-client: aiohttp tracing (AUR; tracing extra)'
  'python-opentelemetry-instrumentation-sqlalchemy: SQLAlchemy tracing (AUR; tracing extra)'
)
backup=('etc/codex-lb/codex-lb.env')
install=codex-lb.install
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${_pkgname}-${pkgver}.tar.gz"
  'codex-lb.service'
  'codex-lb.sysusers'
  'codex-lb.tmpfiles'
  'codex-lb.env'
  'codex-lb.install'
)
sha256sums=('4de6fac5819434f3871da0227d5098154637d2f9fbe2d1af9c5e66b30c199e37'
            '0c63ea72ce0f73dab98653feb8e38b4a6f8fc8cbb0902f8472b08de31e602aeb'
            '31df28070b4619b52a31823b236ec0a6777e00f6f4017bc6b2349539e605727c'
            'f4b5f162049f22a71e63c15dc8012e102479191fdca065ecc9f23e3557c30611'
            '176b9bc94c8b8a01405a0946e2326a869d653b47d3416268576e8611966bf737'
            'f36aeb948d7badb197eefdd37bf8a1d635379dac0bebcbd2d89f8fe21637c1b1')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_pkgname}-${pkgver}"
  # Mirror the upstream release-time invariant: the built wheel must ship the
  # pre-built dashboard assets under app/static/*. The sdist already contains
  # them (no frontend toolchain is invoked at PKGBUILD build time), so this
  # check fails early if hatchling ever stops shipping them.
  local wheel
  wheel=$(printf '%s\n' dist/*.whl | head -n1)
  python -c "
import sys, zipfile
names = zipfile.ZipFile('${wheel}').namelist()
static = [n for n in names if n.startswith('app/static/')]
assert 'app/static/index.html' in names, 'app/static/index.html missing from wheel'
assert any(n.startswith('app/static/assets/') for n in static), 'app/static/assets/* missing from wheel'
print(f'check: wheel ships {len(static)} static files')
"
}

package() {
  cd "${_pkgname}-${pkgver}"
  # --prefix=/usr forces sysconfig to use the system layout regardless of which
  # python the build host runs under (system python or a venv used to stage
  # makedepends). Without it, building inside a venv leaks the venv path into
  # $pkgdir.
  python -m installer --destdir="$pkgdir" --prefix=/usr dist/*.whl

  # installer bakes the build-time interpreter into entry-point shebangs. Pin
  # them to /usr/bin/python so the installed scripts use the system interpreter
  # regardless of which python ran makepkg.
  sed -i '1c#!/usr/bin/python' \
    "$pkgdir/usr/bin/codex-lb" \
    "$pkgdir/usr/bin/codex-lb-db"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm644 "$srcdir/codex-lb.service"  "$pkgdir/usr/lib/systemd/system/codex-lb.service"
  install -Dm644 "$srcdir/codex-lb.sysusers" "$pkgdir/usr/lib/sysusers.d/codex-lb.conf"
  install -Dm644 "$srcdir/codex-lb.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/codex-lb.conf"
  install -Dm640 "$srcdir/codex-lb.env"      "$pkgdir/etc/codex-lb/codex-lb.env"
}
