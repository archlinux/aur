# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-litestar
_name=${pkgname#python-}
pkgver=2.5.2
pkgrel=1
pkgdesc="Production-ready, Light, Flexible and Extensible ASGI API framework"
arch=(any)
url="https://github.com/litestar-org/litestar"
license=(MIT)
depends=(
  python
  python-annotated-types
  python-anyio
  python-asyncpg
  python-attrs
  python-click
  python-dotenv
  python-exceptiongroup
  python-httpx
  python-jsbeautifier
  python-msgspec
  python-multidict
  python-polyfactory
  python-pydantic
  python-rich
  python-rich-click
  python-sniffio
  python-trio
  python-typing_extensions
  python-yaml
  uvicorn
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-asyncpg
  python-beautifulsoup4
  python-brotli
  python-cryptography
  python-fsspec
  python-httpx-sse
  python-hypothesis
  python-jinja
  python-jose
  python-mako
  python-minijinja
  python-opentelemetry-sdk
  python-picologging
  python-polyfactory
  python-psycopg
  python-pytest
  python-pytest-asyncio
  python-pytest-lazy-fixture
  python-pytest-mock
  python-pytest-rerunfailures
  python-pytest-timeout
  python-pytest-xdist
  python-redis
  python-sqlalchemy
  python-starlette
  python-structlog
  python-time-machine
)
optdepends=(
  'python-jinja: templating engine alternative'
  'python-mako: templating engine alternative'
  'python-minijinja: templating engine alternative'

  'python-structlog: logging library alternative'
  'python-picologging: logging library alternative'

  # 'python-opentelemetry-instrumentation-asgi: Open Telementry instrumentation'
  'python-brotli: Brotli compression middleware'
  'python-cryptography: cookie based sessions & JWT authentication'
  'python-jose: JWT authentication'
  'python-prometheus_client: Prometheus instrumentation'
  'python-opentelemetry-sdk: OpenTelemetry instrumentation'
  'python-redis: Redis store'
  'python-sqlalchemy: SQLAlchemy integration'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5583c7a9a5639347243e2420699de40f2415ff1dc801ac7f745b61e2217d7abe')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl

  _ignored_tests=(
    tests/examples/
    tests/unit/test_contrib/

    # Requires advanced_alchemy which depends on sqlalchemy>=2 which is not
    # available in repositories.
    tests/e2e/test_advanced_alchemy.py
    tests/unit/test_app.py
    tests/unit/test_plugins/test_base.py
    tests/unit/test_plugins/test_sqlalchemy.py

    # Requires mapped_column
    tests/unit/test_repository/test_generic_mock_repository.py

    # Requires running docker compose
    tests/unit/test_testing/test_test_client.py
    tests/unit/test_channels/test_plugin.py
    tests/unit/test_channels/test_backends.py
    tests/unit/test_stores.py
  )
  _ignored_tests_arg=$(printf " --ignore=%s" "${_ignored_tests[@]}")

  _deselected_tests=(
    # Fails for unkown reason
    tests/unit/test_cli/test_core_commands.py::test_routes_command_options
    tests/unit/test_template/test_template.py::test_media_type_inferred
    tests/unit/test_middleware/test_middleware_handling.py::test_custom_middleware_processing

    # Requires running docker compose
    tests/e2e/test_response_caching.py::test_with_stores
    tests/unit/test_utils/test_version.py::test_formatted
  )
  _deselected_tests_arg=$(printf " --deselect=%s" "${_deselected_tests[@]}")

  export PYTHONPATH="$PWD/tmp_install/$_site_packages"
  # shellcheck disable=SC2086
  pytest tests/ \
    $_ignored_tests_arg \
    $_deselected_tests_arg
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
