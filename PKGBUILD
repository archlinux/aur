# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name1=logfire-api
_name0=logfire
pkgbase=python-${_name0}
pkgname=(python-${_name1} python-${_name0})
pkgver=3.23.0
pkgrel=1
arch=('any')
url='https://github.com/pydantic/logfire'
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://files.pythonhosted.org/packages/py3/p/pydantic-graph/pydantic_graph-0.4.0-py3-none-any.whl"
        "https://files.pythonhosted.org/packages/py3/p/pydantic-ai-slim/pydantic_ai_slim-0.4.0-py3-none-any.whl") # Prevent cercular dependencies
noextract=('pydantic_graph-0.4.0-py3-none-any.whl' 'pydantic_ai_slim-0.4.0-py3-none-any.whl')
sha256sums=('2485d6f45d619cd81783785101162e20895e6d561a0aca4eb71df902d2fda5fc'
            '85837d1893add25e85da676d7d091a1e5c203ba68def0280a2ed29931f0a8684'
            '9bd3b4121cb6abffb32de46044e1628050762507db8506cf9af94f790e1ab31d')
depends=('python')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
_pydantic_ai_depends=('python-griffe' 'python-opentelemetry-api' 'python-typing-inspection')
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
              ${_pydantic_ai_depends[@]}
              'python-langchain'
              'python-langchain-openai'
              'python-langgraph'
              'python-opentelemetry-instrumentation-google-genai'
              'python-google-genai')

build() {
  cd "${srcdir}"/${_name0//-/_}-${pkgver}
  python -m build --wheel --no-isolation ${_name1}
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
    --deselect tests/otel_integrations/test_google_genai.py::test_instrument_google_genai
  )
  cd "${srcdir}"/${_name0//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ${_name1}/dist/*.whl
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m installer "${srcdir}"/pydantic_graph-0.4.0-py3-none-any.whl
  test-env/bin/python -m installer "${srcdir}"/pydantic_ai_slim-0.4.0-py3-none-any.whl
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
              'python-opentelemetry-instrumentation-aiohttp-client: aiohttp-client'
              'python-opentelemetry-instrumentation-aiohttp-server: aiohttp-server'
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
