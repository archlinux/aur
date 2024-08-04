# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: AngrySoft - Sebastian Zwierzchowski

pkgname=python-sse-starlette
_pkgname=${pkgname#python-}
pkgver=2.1.3
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
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5d12efd5734676cbb115656008136db065730140de1218c99a7d9cb9afb30976')

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
  pytest \
    --ignore tests/integration/test_multiple_consumers.py
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
