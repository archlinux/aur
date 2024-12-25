# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: AngrySoft - Sebastian Zwierzchowski
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-sse-starlette
_pkgname=${pkgname#python-}
pkgver=2.2.1
pkgrel=2
pkgdesc="Server Sent Events (SSE) for Starlette and FastAPI"
arch=(any)
url="https://github.com/sysid/sse-starlette"
license=(BSD-3-Clause)
depends=(
  python
  uvicorn
  python-anyio
  python-starlette
  python-async-timeout
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(
  python-asgi-lifespan
  python-fastapi
  python-httpx
  python-psutil
  python-pytest
  python-pytest-asyncio
  python-portend
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3f069376789418b98c28a6a1d7c94636380caadc2cb8cd62dc032718a117c457')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest -k "not test_sse_multiple_consumers" --ignore=tests/integration/test_multiple_consumers.py
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
