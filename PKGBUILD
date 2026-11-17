# Maintainer: enihcam <enihcam@noreply.gitcode.com>
# Contributor: Google LLC <googleapis-packages@google.com>
# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=a2a-sdk
pkgname=python-$_name
pkgver=1.3.0
pkgrel=1
pkgdesc='A2A Python SDK.'
arch=('any')
url='https://github.com/a2aproject/a2a-python'
license=('Apache-2.0')
depends=('python'
         'python-httpx'
         'python-pydantic'
         'python-protobuf'
         'python-google-api-core'
         'python-json-rpc'
         'python-googleapis-common-protos'
         'python-packaging')
makedepends=('python-hatchling'
             'python-uv-dynamic-versioning'
             'python-build'
             'python-installer')
checkdepends=('python-fastapi'
              'python-pyjwt'
              'python-pytest'
              'python-pytest-asyncio'
              'python-pytest-mock'
              'python-pytest-xdist'
              'python-respx'
              'python-rfc8785'
              'uvicorn'
              'python-pytest-timeout'
              'python-sse-starlette'
              'python-starlette'
              'python-cryptography'
              'python-grpcio'
              'python-opentelemetry-api'
              'python-opentelemetry-sdk'
              'python-sqlalchemy'
              'python-greenlet'
              'python-aiosqlite'
              'python-alembic')
optdepends=('python-sse-starlette: http-server'
            'python-starlette: http-server'

            'python-sse-starlette: fastapi'
            'python-starlette: fastapi'
            'python-fastapi: fastapi'

            'python-cryptography: encryption'

            'python-grpcio: grpc'
            'python-grpcio-tools: grpc'
            'python-grpcio-reflection: grpc'

            'python-opentelemetry-api: telemetry'
            'python-opentelemetry-sdk: telemetry'

            'python-sqlalchemy: postgresql'
            'python-greenlet: postgresql'
            'python-asyncpg: postgresql'

            'python-sqlalchemy: mysql'
            'python-greenlet: mysql'
            'python-aiomysql: mysql'

            'python-pyjwt: signing'

            'python-sqlalchemy: sqlite'
            'python-greenlet: sqlite'
            'python-aiosqlite: sqlite'

            'python-alembic: db-cli'

            'python-sqlalchemy: sql'
            'python-greenlet: sql'
            'python-asyncpg: sql'
            'python-aiomysql: sql'
            'python-aiosqlite: sql'

            'python-sse-starlette: all'
            'python-starlette: all'
            'python-fastapi: all'
            'python-sqlalchemy: all'
            'python-greenlet: all'
            'python-asyncpg: all'
            'python-aiomysql: all'
            'python-aiosqlite: all'
            'python-cryptography: all'
            'python-grpcio: all'
            'python-grpcio-tools: all'
            'python-grpcio-reflection: all'
            'python-opentelemetry-api: all'
            'python-opentelemetry-sdk: all'
            'python-pyjwt: all'
            'python-alembic: all')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "fix-test-task-resubscription.patch")
sha256sums=('3e7f7b1ffcf6c13ec35c674569123306be7aa067f514c4124868a3ba9ad3ced3'
            '364d5d85e977b2815d66ef1b33b47cd2df4773c4b35ec7aa4d492a1588e269f4')

prepare() {
  cd "a2a-python-$pkgver"
  # test_task_resubscription stopped reading after the first SSE event, then expected all three;
  # backport upstream's fix (6ca8593, #1406)
  patch -Np1 -i "$srcdir"/fix-test-task-resubscription.patch
}

build() {
  cd "a2a-python-$pkgver"
  export UV_DYNAMIC_VERSIONING_BYPASS=$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --deselect tests/integration/cross_version
  )
  cd "a2a-python-$pkgver"
  PYTHONPATH="$PWD/src" pytest "${pytest_options[@]}"
}

package() {
  cd "a2a-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
