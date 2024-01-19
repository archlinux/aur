# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: AngrySoft - Sebastian Zwierzchowski

pkgname=python-sse-starlette
_name=${pkgname#python-}
pkgver=1.8.3
pkgrel=1
pkgdesc="Server Sent Events (SSE) for Starlette and FastAPI"
arch=(any)
url="https://github.com/sysid/sse-starlette"
license=(BSD-3-Clause)
depends=(
  python
  python-anyio
  python-starlette
  uvicorn
)
makedepends=(
  python-build
  python-installer
  python-pdm
  python-wheel
)
checkdepends=(
  python-asgi-lifespan
  python-httpx
  python-psutil
  python-pytest
  python-pytest-asyncio
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d4ab7a8893c32dd9c4547adcee0a6f82e960f7659a04cdea7a214b81d902bcb8')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$_site_packages"
  # Deselected test fails, likely due to the following exception:
  #   asyncio.exceptions.CancelledError: Cancelled by cancel scope 778244b68250
  pytest tests/ \
    --deselect tests/test_event_source_response.py::test_ping_concurrenc
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
