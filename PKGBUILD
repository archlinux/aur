# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name1=logfire-api
_name0=logfire
pkgbase=python-${_name0}
pkgname=(python-${_name1} python-${_name0})
pkgver=3.12.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/pydantic/logfire'
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("https://download.docker.com/linux/static/stable/x86_64/docker-28.0.4.tgz"
               "https://download.docker.com/linux/static/stable/x86_64/docker-rootless-extras-28.0.4.tgz")
source_aarch64=("https://download.docker.com/linux/static/stable/aarch64/docker-28.0.4.tgz"
                "https://download.docker.com/linux/static/stable/aarch64/docker-rootless-extras-28.0.4.tgz")
sha256sums=('e4dc3d5e50802979500e8763e8c296df9fc0579b34da5fedeac25f0fc15e46a2')
sha256sums_x86_64=('6b130fa5fb13516620d5ece0b63f63a495cede428bb2f9e24449022e9d72e0cb'
                   '0d0c2680d924671df0ac33d53dd71f410dfb253fb4fa5e8a0a231951234781c9')
sha256sums_aarch64=('d3291093e8ed576ed9e237b24dc4556a9ed21ff25d4c26578df612cb6fe0480f'
                    'ce155e65690fc1cbbd3656495458d3ca004af2404a35d37953ea2123d6c4bbf6')
depends=('python>=3.8')
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
              'python-setuptools'
              'python-aiosqlite'
              'python-boto3'
              'python-botocore'
              'python-greenlet'
              'python-pytest-xdist'
              'python-openai-agents'
              'python-websockets'
              'python-pydantic-ai-slim')

build() {
  cd "${srcdir}"/${_name0//-/_}-${pkgver}
  python -m build --wheel --no-isolation ${_name1}
  python -m build --wheel --no-isolation
}

run_docker_rootless(){
  cp -rf docker-rootless-extras/* docker/
  cd "${srcdir}"/docker
  mkdir -p state
  mkdir -p docker-data
  (exec env PATH="${srcdir}"/docker:$PATH rootlesskit \
      --state-dir="${srcdir}"/docker/state \
      --net=vpnkit --mtu=1500 \
      --slirp4netns-sandbox="auto" \
      --slirp4netns-seccomp="auto" \
      --disable-host-loopback --port-driver="builtin" \
      --copy-up=/etc --copy-up=/run \
      --propagation=rslave \
      dockerd --iptables=$(pacman -Qs iptables &>/dev/null && echo true || echo false) --data-root "${srcdir}"/docker/docker-data &)
  env PATH="${srcdir}"/docker:$PATH ./docker --context=default context create "rootless" --docker "host=unix://${XDG_RUNTIME_DIR}/docker.sock" --description "Rootless mode" > /dev/null | true
  env PATH="${srcdir}"/docker:$PATH ./docker --context=default context use "rootless" > /dev/null | true
}

stop_docker_rootless(){
  cd "${srcdir}"/docker
  env PATH="${srcdir}"/docker:$PATH ./docker --context=default context rm -f "rootless" > /dev/null
  pkill -f dockerd
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
    --dist=loadgroup
    # Test for Logfire developers
    --deselect tests/aaa_query_client/test_query_client.py
  )
  run_docker_rootless
  cd "${srcdir}"/${_name0//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ${_name1}/dist/*.whl
  test-env/bin/python -m installer dist/*.whl
  TESTCONTAINERS_DOCKER_SOCKET_OVERRIDE=${XDG_RUNTIME_DIR}/docker.sock DOCKER_HOST=unix:///${XDG_RUNTIME_DIR}/docker.sock test-env/bin/python -m pytest "${pytest_options[@]}" tests
  stop_docker_rootless
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
