# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name1=logfire-api
_name0=logfire
pkgbase=python-${_name0}
pkgname=(python-${_name1} python-${_name0})
pkgver=3.6.2
pkgrel=2
arch=('any')
url='https://github.com/pydantic/logfire'
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4a087945108b112aaa04496d1cb1a1bacb8e152f39f58e16ff06ae8deac15fe3')
depends=('python>=3.8')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-anyio'
              'python-httpx'
              'python-aiohttp'
              'python-redis'
              'python-pymongo'
              'python-fastapi'
              'python-flask'
              'python-django'
              'python-dirty-equals'
              'python-pytest'
              'python-pytest-django'
              'python-pytest-pretty'
              'python-pydantic'
              'python-requests'
              'python-sqlalchemy'
              'python-pandas'
              'python-attrs'
              'python-openai'
              'python-opentelemetry-instrumentation-aiohttp-client'
              'python-opentelemetry-instrumentation-asgi'
              'python-opentelemetry-instrumentation-wsgi'
              'python-opentelemetry-instrumentation-fastapi'
              'python-opentelemetry-instrumentation-starlette'
              'python-opentelemetry-instrumentation-flask'
              'python-opentelemetry-instrumentation-django'
              'python-opentelemetry-instrumentation-httpx'
              'python-opentelemetry-instrumentation-requests'
              'python-opentelemetry-instrumentation-sqlalchemy'
              'python-opentelemetry-instrumentation-system-metrics'
              'python-opentelemetry-instrumentation-asyncpg'
              'python-opentelemetry-instrumentation-psycopg'
              'python-opentelemetry-instrumentation-psycopg2'
              'python-opentelemetry-instrumentation-redis'
              'python-opentelemetry-instrumentation-pymongo'
              'python-opentelemetry-instrumentation-celery'
              'python-opentelemetry-instrumentation-mysql'
              'python-opentelemetry-instrumentation-sqlite3'
              'python-opentelemetry-instrumentation-aws-lambda'
              'python-eval-type-backport'
              'python-requests-mock'
              'python-inline-snapshot'
              'python-structlog'
              'python-loguru'
              'python-ruff'
              'pyright'
              'python-coverage'
              'python-psycopg'
              'python-psycopg2'
              'python-asyncpg'
              'python-pymysql'
              'python-cryptography'
              'python-cloudpickle'
              'python-anthropic'
              'python-sqlmodel'
              'python-celery'
              'python-testcontainers'
              'python-mysql-connector'
              'python-pyarrow'
              'python-numpy'
              'python-pytest-recording'
              'python-vcrpy'
              'uvicorn'
              'python-logfire-api'
              'python-setuptools'
              'python-aiosqlite'
              'python-boto3'
              'python-botocore'
              'python-greenlet'
              'python-pytest-xdist')

build() {
  cd "${srcdir}"/${_name0//-/_}-${pkgver}
  python -m build --wheel --no-isolation ${_name1}
  python -m build --wheel --no-isolation
}

update_compression_methods() {
    local file="$1"
    local compression_methods="gzip, deflate"
    if pacman -Q python-brotli &>/dev/null || pacman -Q python-brotlicffi &>/dev/null; then
        compression_methods+=", br"
    fi
    if pacman -Q python-zstandard &>/dev/null; then
        compression_methods+=", zstd"
    fi
    sed -i -E "s/gzip, deflate(, br)?(, zstd)?/\1$compression_methods/" "$file"
}


check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
    --dist=loadgroup
    # Test for Logfire developers
    --deselect tests/aaa_query_client/test_query_client.py
    # Deselct for issue there (https://gitlab.archlinux.org/archlinux/packaging/packages/python-sqlalchemy/-/issues/1)
    --deselect tests/otel_integrations/test_sqlalchemy.py
  )
  cd "${srcdir}"/${_name0//-/_}-${pkgver}
  update_compression_methods tests/otel_integrations/test_httpx.py # Adding necessary encoding headers if exist
  update_compression_methods tests/otel_integrations/test_starlette.py # Adding necessary encoding headers if exist
  sed -i -E "s/\bpsycopg2-binary\b/psycopg2/g" tests/otel_integrations/test_psycopg.py # The python-psycopg2 build process is the same as psycopg2-binary
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ${_name1}/dist/*.whl
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package_python-logfire-api() {
  pkgdesc='Shim for the Logfire SDK which does nothing unless Logfire is installed.'
  url='https://github.com/pydantic/logfire/tree/main/logfire-api'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" ${_name1}/dist/*.whl
}

package_python-logfire() {
  pkgdesc='The best Python observability tool!'
  depends+=('python-opentelemetry-sdk' 'python-opentelemetry-exporter-otlp-proto-http' 'python-opentelemetry-instrumentation' 'python-rich' 'python-protobuf' 'python-typing_extensions' 'python-executing')
  optdepends=('python-opentelemetry-instrumentation-system-metrics: system-metrics'
            'python-opentelemetry-instrumentation-asgi: asgi'
            'python-opentelemetry-instrumentation-wsgi: wsgi'
            'python-opentelemetry-instrumentation-aiohttp-client: aiohttp'
            'python-opentelemetry-instrumentation-celery: celery'
            'python-opentelemetry-instrumentation-django: django'
            'python-opentelemetry-instrumentation-fastapi: fastapi'
            'python-opentelemetry-instrumentation-flask: flask'
            'python-opentelemetry-instrumentation-httpx: httpx'
            'python-opentelemetry-instrumentation-starlette: starlette'
            'python-opentelemetry-instrumentation-sqlalchemy: sqlalchemy'
            'python-opentelemetry-instrumentation-asyncpg: asyncpg'
            'python-opentelemetry-instrumentation-psycopg: psycopg'
            'python-opentelemetry-instrumentation-psycopg2: psycopg2'
            'python-opentelemetry-instrumentation-pymongo: pymongo'
            'python-opentelemetry-instrumentation-redis: redis'
            'python-opentelemetry-instrumentation-requests: requests'
            'python-opentelemetry-instrumentation-mysql: mysql'
            'python-opentelemetry-instrumentation-sqlite3: sqlite3'
            'python-opentelemetry-instrumentation-aws-lambda: aws-lambda')
  url='https://github.com/pydantic/logfire'
  cd "${srcdir}"/${_name0}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
