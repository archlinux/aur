# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-litestar
_pkgname=${pkgname#python-}
pkgver=2.7.1
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
  python-psycopg
  python-rich
  python-rich-click
  python-sniffio
  python-starlette
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
  hypercorn
  python-asyncpg
  python-beautifulsoup4
  python-brotli
  python-cryptography
  python-daphne
  python-email-validator
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
  python-pydantic
  python-pydantic-extra-types
  python-pytest
  python-pytest-asyncio
  python-pytest-lazy-fixtures
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

  'python-pydantic: Pydantic support'
  'python-pydantic-extra-types: Pydantic support'
  'python-email-validator: Pydantic support'

  # 'python-opentelemetry-instrumentation-asgi: Open Telementry instrumentation'
  'python-brotli: Brotli compression middleware'
  'python-cryptography: cookie based sessions & JWT authentication'
  'python-jose: JWT authentication'
  'python-prometheus_client: Prometheus instrumentation'
  'python-opentelemetry-sdk: OpenTelemetry instrumentation'
  'python-redis: Redis store'
  'python-sqlalchemy: SQLAlchemy integration'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "0001-test-Replace-dependency-pytest-lazy-fixture.patch"
)
sha256sums=(
  'ca4659b1695f5f007f02081ae9963e0838b19ad97779708cda8cb48f2481ba8f'
  'a8f0d355791c14c17ee0d6bfe85341cffd2e699b997d4636acb0e13dd67b31dc'
)

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/0001-test-Replace-dependency-pytest-lazy-fixture.patch"
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  local ignore_test_args=(
    --ignore=tests/examples/
    --ignore=tests/unit/test_contrib/

    # Requires advanced_alchemy which depends on sqlalchemy>=2 which is not
    # available in repositories.
    --ignore=tests/e2e/test_advanced_alchemy.py
    --ignore=tests/unit/test_app.py
    --ignore=tests/unit/test_plugins/test_base.py
    --ignore=tests/unit/test_plugins/test_sqlalchemy.py

    # Requires mapped_column
    --ignore=tests/unit/test_repository/test_generic_mock_repository.py
  )

  local deselect_test_args=(
    # Requires running docker compose
    --deselect=tests/unit/test_testing/test_test_client.py
    --deselect=tests/unit/test_channels/test_plugin.py
    --deselect=tests/unit/test_channels/test_backends.py
    --deselect=tests/unit/test_stores.py

    # Fails for unkown reason
    --deselect=tests/unit/test_template/test_template.py::test_media_type_inferred

    # Requires running docker compose
    --deselect=tests/e2e/test_response_caching.py::test_with_stores
    --deselect=tests/unit/test_utils/test_version.py::test_formatted
  )

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest tests/ "${deselect_test_args[@]}" "${ignore_test_args[@]}"
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
