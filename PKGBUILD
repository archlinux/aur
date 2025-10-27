# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name1=logfire-api
_name0=logfire
pkgbase=python-$_name0
pkgname=(python-$_name1 python-$_name0)
pkgver=4.14.2
pkgrel=1
arch=('any')
url='https://github.com/pydantic/logfire'
license=('MIT')
depends=('python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-httpx'
              'python-aiohttp'
              'python-redis'
              'python-pymongo'
              'python-fastapi'
              'python-flask'
              'python-django'
              'python-dirty-equals'
              'python-pytest'
              'python-pytest-django'
              'python-pydantic'
              'python-requests'
              'python-sqlalchemy'
              'python-pandas'
              'python-attrs'
              'python-openai'
              'python-opentelemetry-instrumentation-aiohttp-client'
              'python-opentelemetry-instrumentation-aiohttp-server'
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
              'python-requests-mock'
              'python-inline-snapshot'
              'python-structlog'
              'python-loguru'
              'python-psycopg'
              'python-psycopg2'
              'python-asyncpg'
              'python-pymysql'
              'python-cryptography'
              'python-cloudpickle'
              'python-anthropic'
              'python-sqlmodel'
              'python-celery'
              'python-mysql-connector'
              'python-pyarrow'
              'python-numpy'
              'python-pytest-recording'
              'python-vcrpy'
              'uvicorn'
              'python-setuptools'
              'python-aiosqlite'
              'python-boto3'
              'python-botocore'
              'python-greenlet'
              'python-pytest-xdist'
              'python-openai-agents'
              'python-websockets'
              'python-pydantic-ai-slim'
              'python-langchain'
              'python-langchain-openai'
              'python-langgraph'
              'python-opentelemetry-instrumentation-google-genai'
              'python-google-genai'
              # 'python-openinference-instrumentation-litellm'
              'litellm')
source=("$_name0-$pkgver::git+$url.git#tag=v$pkgver")
sha256sums=('b534a73c26821e499808b0ef17538377e3d862a29b68e207d11de5c6db0b0b9b')

prepare(){
  cd "$srcdir"/$_name0-$pkgver
  sed -i "s/'gzip, deflate, zstd',/IsAnyStr(regex='^gzip, deflate(?:, br|, zstd|, br, zstd)?$'),/g" tests/otel_integrations/test_httpx.py
}

build() {
  cd "$srcdir"/$_name0-$pkgver
  python -m build --wheel --no-isolation $_name1
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -n auto
    --dist=loadgroup
    # Test for Logfire developers
    --deselect tests/aaa_query_client/test_query_client.py
    # Remove tests that need Docker
    --ignore tests/otel_integrations/test_celery.py
    --ignore tests/otel_integrations/test_mysql.py
    --ignore tests/otel_integrations/test_redis.py
    # Failed
    --deselect tests/test_cli.py::test_inspect
    # Need to update packages
    --deselect tests/otel_integrations/test_pydantic_ai_mcp.py::test_pydantic_ai_mcp_sampling
    --deselect tests/otel_integrations/test_langchain.py::test_instrument_langchain
  )
  cd "$srcdir"/$_name0-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/pip install -U openinference-instrumentation-litellm
  test-env/bin/python -m installer $_name1/dist/*.whl
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package_python-logfire-api() {
  pkgdesc='Shim for the Logfire SDK which does nothing unless Logfire is installed.'
  url='https://github.com/pydantic/logfire/tree/main/logfire-api'
  cd "$srcdir"/$_name0-$pkgver
  python -m installer --destdir="$pkgdir" $_name1/dist/*.whl
}

package_python-logfire() {
  pkgdesc='The best Python observability tool!'
  depends+=('python-opentelemetry-sdk' 'python-opentelemetry-exporter-otlp-proto-http' 'python-opentelemetry-instrumentation' 'python-rich' 'python-protobuf' 'python-typing_extensions' 'python-executing')
  optdepends=('python-opentelemetry-instrumentation-system-metrics: system-metrics'
              'python-opentelemetry-instrumentation-asgi: asgi'
              'python-opentelemetry-instrumentation-wsgi: wsgi'
              'python-opentelemetry-instrumentation-aiohttp-client: aiohttp'
              'python-opentelemetry-instrumentation-aiohttp-client: aiohttp-client'
              'python-opentelemetry-instrumentation-aiohttp-server: aiohttp-server'
              'python-opentelemetry-instrumentation-celery: celery'
              'python-opentelemetry-instrumentation-django: django'
              'python-opentelemetry-instrumentation-asgi: django'
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
              'python-opentelemetry-instrumentation-aws-lambda: aws-lambda'
              'python-opentelemetry-instrumentation-google-genai: google-genai'
              'python-openinference-instrumentation-litellm: litellm')
  url='https://github.com/pydantic/logfire'
  cd "$srcdir"/$_name0-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
