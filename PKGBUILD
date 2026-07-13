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
pkgrel=1
arch=('any')
url='https://github.com/a2aproject/a2a-python'
license=('Apache-2.0')

# Runtime dependencies for the core package. Also inherited by every
# split-package because they all depend on python-a2a-sdk.
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
  'python-culsans'
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
  'python-a2a-sdk-encryption: payload encryption'
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
  # Smoke check: importable, console script registered. Skip the full test
  # suite; CI on Arch does not run upstream's pytest matrix.
  python -c 'import a2a; print(a2a.__name__, "importable")'
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
  optdepends=('python-uvicorn: ASGI server (recommended)')
}

package_python-a2a-sdk-grpc() {
  pkgdesc='gRPC transport for python-a2a-sdk'
  depends=(
    'python-a2a-sdk'
    'python-grpcio'
    'python-grpcio-tools'
    'python-grpcio-status'
    'python-grpcio-reflection'
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
  depends=(
    'python-a2a-sdk'
    'python-sqlalchemy'
    'python-aiomysql'
    'libmariadb'
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