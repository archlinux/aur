# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-httpx-sse
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc="Consume Server-Sent Event (SSE) messages with HTTPX"
arch=(any)
url="https://github.com/florimondmanca/httpx-sse"
license=(MIT)
depends=(
  python
  python-httpx
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  python-sse-starlette
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3c0a5eb3ddb855e99d3e5c8c86c524bbc5dbca71225769c6a19ee9456ebd8c52')

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
  pytest --override-ini="addopts="
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
