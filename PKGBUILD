# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name1=logfire-api
_name0=logfire
pkgbase=python-${_name0}
pkgname=(python-${_name1} python-${_name0})
pkgver=3.10.0
pkgrel=1
arch=('x86_64' 'aarch64')
url='https://github.com/pydantic/logfire'
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("https://download.docker.com/linux/static/stable/x86_64/docker-28.0.3.tgz"
               "https://download.docker.com/linux/static/stable/x86_64/docker-rootless-extras-28.0.3.tgz")
source_aarch64=("https://download.docker.com/linux/static/stable/aarch64/docker-28.0.3.tgz"
                "https://download.docker.com/linux/static/stable/aarch64/docker-rootless-extras-28.0.3.tgz")
sha256sums=('fe241864c708a7ec9c3f1c23f107f3e3d68373b41ec9ebefee7ef035a73b38e4')
sha256sums_x86_64=('d1810799dad3ca21647728e4b501bf64def617f2a3e8cdcdfcd5e4a5d0e69e5c'
                   'f9e3102a996c3b24ab2cebfa169bb9cb4bbb95b866358b285ab65d3a3b9b4800')
sha256sums_aarch64=('6a5fe587e1224871a87ef46dede1dd65cfb69a2c61e1368556f59c2e78d67d7f'
                    '0a1a09e4f43aa416de539c238a33438a31955475dbee91f38413b4a8c69be070')
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

prepare(){
  cd "${srcdir}"/${_name0//-/_}-${pkgver}
  # Adding necessary encoding headers if exist
  update_compression_methods tests/otel_integrations/test_httpx.py
  update_compression_methods tests/otel_integrations/test_starlette.py
  # The python-psycopg2 build process is the same as psycopg2-binary
  sed -i "s/assert check_version('psycopg2-binary', '2.7.3.1', Psycopg2Instrumentor())/assert check_version('psycopg2-binary', '2.7.3.1', Psycopg2Instrumentor()) or check_version('psycopg2', '2.7.3.1', Psycopg2Instrumentor())/" tests/otel_integrations/test_psycopg.py
}

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
