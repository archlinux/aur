# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aiohttp-middlewares
_name=${pkgname#python-}
pkgver=2.2.1
pkgrel=1
pkgdesc="Collection of useful middlewares for aiohttp.web applications"
arch=(any)
url="https://github.com/playpauseandstop/aiohttp-middlewares"
license=(custom:BSD3)
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
sha256sums=('823bb0598079563ab06d18daf500796c9d8a3893bdd89678f9960185ce04a4e1')

_archive="$_name-$pkgver"

prepare() {
  rm "$_archive/.python-version"
}

build() {
  cd "$_archive"

  GIT_DIR=$PWD python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  PYTHONPATH=src/ python -m pytest --override-ini='addopts=""'
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
