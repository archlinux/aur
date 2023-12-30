# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-litestar
_name=${pkgname#python-}
pkgver=2.4.5
pkgrel=1
pkgdesc="Production-ready, Light, Flexible and Extensible ASGI API framework"
arch=(any)
url="https://github.com/litestar-org/litestar"
license=(MIT)
depends=(
  python
  python-annotated-types
  python-anyio
  python-attrs
  python-brotli
  python-click
  python-cryptography
  python-dotenv
  python-exceptiongroup
  python-httpx
  python-jose
  python-jsbeautifier
  python-minijinja
  python-msgspec
  python-multidict
  python-picologging
  python-redis
  python-rich
  python-rich-click
  python-structlog
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
  python-fsspec
  python-hypothesis
  python-jinja
  python-mako
  python-polyfactory
  python-pytest
  python-pytest-asyncio
  python-pytest-lazy-fixture
  python-pytest-mock
  python-pytest-rerunfailures
  python-pytest-timeout
  python-pytest-xdist
  python-starlette
  python-time-machine
  python-trio
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8df8b32a7fb6fb5769dbbe4167371be97d8c777a8a8ecde0a30974a9983bae1e')

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

    # Requires httpx_sse
    tests/unit/test_response/test_streaming_response.py

    # Requires running docker compose
    tests/unit/test_testing/test_test_client.py
    tests/unit/test_channels/test_plugin.py
    tests/unit/test_channels/test_backends.py
    tests/unit/test_stores.py
  )
  _ignored_tests_arg=$(printf " --ignore=%s" "${_ignored_tests[@]}")

  # shellcheck disable=SC2086
  PYTHONPATH="$PWD/tmp_install/$_site_packages" \
    pytest \
    $_ignored_tests_arg \
    -k " \
      not test_with_stores[redis_store]\
      and not test_formatted[False-2.0.0alpha1] \
      and not test_life_span_startup_error_handling \
      and not test_lifespan_startup_failure \
      and not test_dependency_batch_with_exception \
      and not test_media_type_inferred[.xml-application/xml] \
      and not test_media_type_inferred[.xml.other-application/xml] \
    "
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
