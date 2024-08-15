# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aiohttp-middlewares
_pkgname=${pkgname#python-}
pkgver=2.4.0
pkgrel=1
pkgdesc="Collection of useful middlewares for aiohttp.web applications"
arch=(any)
url="https://github.com/playpauseandstop/aiohttp-middlewares"
license=(BSD-3-Clause)
depends=(
  python
  python-aiohttp
  python-async-timeout
  python-attrs
  python-yarl
)
makedepends=(
  python-build
  python-installer
  python-poetry-core
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-aiohttp
  python-pytest-asyncio
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5828f8640b6f8701a07f57a4f52812105275c9dffb64395f27aa382c449a41a3')

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
  pytest --override-ini="addopts="
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
