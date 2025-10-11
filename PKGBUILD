# Maintainer: envolution
# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-httpx-sse
_name=${pkgname#python-}
pkgver=0.4.3
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
sha256sums=('926e88187fa45117882f287955dbcb53c1c4ec36148893f0c514f021b7f3b000')

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
  python -m pytest --override-ini="addopts=" -k "not test_asgi_test"
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
