# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aiohttp-middlewares
_pkgname=${pkgname#python-}
pkgver=2.3.0
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
sha256sums=('34930447fe09ed66f9dd2d91a9ecc4a6d00c9671bf7e04dae55d3c96d64649e2')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest --override-ini="addopts="
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
