# Maintainer: enihcam <enihcam@noreply.gitcode.com>
# Contributor: Google LLC <googleapis-packages@google.com>

pkgbase=python-a2a-sdk
pkgname=(
  python-a2a-sdk
  python-a2a-sdk-fastapi
  python-a2a-sdk-grpc
  python-a2a-sdk-telemetry
  python-a2a-sdk-signing
  python-a2a-sdk-postgresql
  python-a2a-sdk-mysql
  python-a2a-sdk-sqlite
  python-a2a-sdk-db-cli
)
pkgver=1.1.0
pkgrel=3
arch=('any')
url='https://github.com/a2aproject/a2a-python'
license=('Apache-2.0')

# Runtime dependencies for the core package. Also inherited by every
# split-package because they all depend on python-a2a-sdk.
#
# Notes on removed candidates:
#   - culsans: upstream gates it to `python_full_version < '3.13'`; Arch
#     ships python 3.14 (cachyos-v3) or 3.13 (extra), so on the supported
#     Arch python versions a2a falls back to the stdlib queue and
#     culsans is never imported. No Arch package exists.
_common_deps=(
  'python'
  'python-httpx'
  'python-httpx-sse'
  'python-pydantic'
  'python-protobuf'
  'python-google-api-core'
  'python-googleapis-common-protos'
  'python-json-rpc'
  'python-packaging'
  # The a2a-db console script imports alembic; ship it with core so the
  # binary works out-of-the-box. Tiny dep.
  'python-alembic'
)

makedepends=(
  'git'                         # uv-dynamic-versioning probes git tags
  'python-build'
  'python-installer'
  'python-wheel'
  'python-hatchling'
  'python-uv-dynamic-versioning'
)

# Extra runtime deps that check() needs to import a2a. These are NOT
# build-time; makepkg installs them into the host before running check().
# All eight are already in _common_deps — duplicating only the ones the
# check actually exercises.
checkdepends=(
  'python-httpx'
  'python-httpx-sse'
  'python-pydantic'
  'python-protobuf'
  'python-google-api-core'
  'python-googleapis-common-protos'
  'python-json-rpc'
  'python-packaging'
)

source=(
  "https://files.pythonhosted.org/packages/c7/7e/8ac10bbf8b15b16574355f39b17dbdf617a282c27b41c7ff2116e30336df/a2a_sdk-${pkgver}.tar.gz"
)
sha256sums=('e8102dad1b36709dbdc3d19319e38e6dfa3b3a79c30416030eb2d482576be204')

# Core package (first entry in pkgname=)
pkgdesc='Python SDK for the Agent2Agent (A2A) Protocol v1.0'
depends=("${_common_deps[@]}")
optdepends=(
  'python-cryptography: Fernet-encrypted push notification config storage'
  'python-a2a-sdk-fastapi: FastAPI integration (HTTP+JSON server)'
  'python-a2a-sdk-grpc: gRPC transport'
  'python-a2a-sdk-telemetry: OpenTelemetry instrumentation'
  'python-a2a-sdk-signing: JWT-based request signing'
  'python-a2a-sdk-postgresql: PostgreSQL task store'
  'python-a2a-sdk-mysql: MySQL task store'
  'python-a2a-sdk-sqlite: SQLite task store'
  'python-a2a-sdk-db-cli: a2a-db console script (requires alembic, shipped)'
)

prepare() {
  cd "$srcdir/a2a_sdk-$pkgver"
  # The sdist tarball has no .git/ history. uv-dynamic-versioning reads git
  # tags by default; bypass with the static pkgver we already know.
  export UV_DYNAMIC_VERSIONING_BYPASS="$pkgver"
}

build() {
  cd "$srcdir/a2a_sdk-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/a2a_sdk-$pkgver"

  # 1. build() must have produced the wheel.
  test -f dist/*.whl || { echo 'no wheel at dist/'; return 1; }

  # 2. Extract the wheel into a throwaway prefix and validate that the
  #    a2a core imports + the a2a-db console-script entry point are both
  #    present. checkdepends gave us the runtime deps at /usr; setting
  #    PYTHONPATH lets us pull a2a/ off the extracted tree without
  #    touching $HOME/.local or /usr.
  local _tmp
  _tmp=$(mktemp -d)
  python -m zipfile -e dist/*.whl "$_tmp"

  local _wheel
  _wheel=$(printf '%s' dist/*.whl)
  PYTHONPATH="$_tmp" _CHECK_WHEEL="$_wheel" python <<'PY'
import os, sys, zipfile
import a2a, a2a.types, a2a.server, a2a.client, a2a.utils
print(f'a2a importable: {a2a.__file__}')

# Confirm a2a-db is declared as a console-script entry point by inspecting
# the wheel's entry_points.txt directly (no install needed).
wheel = os.environ['_CHECK_WHEEL']
expected = 'a2a-db = a2a.a2a_db_cli:run_migrations'
with zipfile.ZipFile(wheel) as z:
    hits = [n for n in z.namelist() if n.endswith('entry_points.txt')]
    assert hits, 'wheel has no entry_points.txt'
    body = z.read(hits[0]).decode()
    assert expected in body, f'expected {expected!r} in entry_points.txt, got:\n{body}'
print(f'a2a-db entry point registered: {expected}')
PY
  local _rc=$?
  rm -rf "$_tmp"
  return "$_rc"
}

package_python-a2a-sdk() {
  cd "$srcdir/a2a_sdk-$pkgver"
  # pyproject-installer needs both --destdir AND --prefix=/usr; without --prefix
  # the sysconfig-derived scheme points at the build-time python prefix (the
  # venv), not at /usr. Together they yield /usr/lib/pythonX.Y/site-packages/...
  # and /usr/bin/<console-script>.
  python -m installer --destdir="$pkgdir" --prefix=/usr dist/*.whl
  # shellcheck disable=SC2128 # $pkgname here is a single string in the per-package function body
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Split-packages below are meta-packages: they pull extra dependencies but
# install no new files (the extra deps are runtime-only).

package_python-a2a-sdk-fastapi() {
  pkgdesc='FastAPI integration for python-a2a-sdk'
  depends=(
    'python-a2a-sdk'
    'python-fastapi'
    'python-sse-starlette'
    'python-starlette'
  )
  optdepends=('uvicorn: ASGI server (recommended)')
}

package_python-a2a-sdk-grpc() {
  pkgdesc='gRPC transport for python-a2a-sdk'
  # Notes on removed candidates:
  #   - grpcio-reflection: listed in upstream's grpc extra but not
  #     actually imported anywhere in src/a2a/. No Arch package exists;
  #     users that want gRPC server reflection can install it from PyPI.
  #   - grpcio-status: not in [core]/[extra]; available as
  #     python-grpcio-status in the AUR. Listed as a depends (not
  #     optdepends) so the grpc split pulls it in transitively.
  depends=(
    'python-a2a-sdk'
    'python-grpcio'
    'python-grpcio-tools'
    'python-grpcio-status'
    'openssl'
    'c-ares'
    'zlib'
  )
}

package_python-a2a-sdk-telemetry() {
  pkgdesc='OpenTelemetry instrumentation for python-a2a-sdk'
  depends=(
    'python-a2a-sdk'
    'python-opentelemetry-api'
    'python-opentelemetry-sdk'
  )
}

package_python-a2a-sdk-signing() {
  pkgdesc='JWT-based request signing for python-a2a-sdk'
  depends=('python-a2a-sdk' 'python-pyjwt')
}

package_python-a2a-sdk-postgresql() {
  pkgdesc='PostgreSQL task store for python-a2a-sdk'
  depends=(
    'python-a2a-sdk'
    'python-sqlalchemy'
    'python-asyncpg'
    'postgresql-libs'
  )
}

package_python-a2a-sdk-mysql() {
  pkgdesc='MySQL task store for python-a2a-sdk'
  # Arch ships the MariaDB client library as `mariadb-libs` (not
  # `libmariadb` — that name doesn't exist).
  depends=(
    'python-a2a-sdk'
    'python-sqlalchemy'
    'python-aiomysql'
    'mariadb-libs'
  )
}

package_python-a2a-sdk-sqlite() {
  pkgdesc='SQLite task store for python-a2a-sdk'
  depends=(
    'python-a2a-sdk'
    'python-sqlalchemy'
    'python-aiosqlite'
  )
}

package_python-a2a-sdk-db-cli() {
  pkgdesc='a2a-db console script dependencies for python-a2a-sdk'
  depends=(
    'python-a2a-sdk'
    'python-alembic'
  )
}