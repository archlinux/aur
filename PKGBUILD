# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Richard Quirk

pkgname=cmake-lint
pkgver=1.4.2
pkgrel=4
pkgdesc="Check for coding style issues in CMake files"
arch=(any)
url="https://github.com/cmake-lint/cmake-lint"
license=(Apache)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-pytest-runner
  python-setuptools
  python-wheel
)
checkdepends=(
  python-mock
  python-pytest
  python-pytest-mock
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('bf060987c74e07890f7314a4832c2e54ffb9c5c1e6d799387bc438010f918676')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  sed -i '/scripts=/d' setup.py
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest \
    --rootdir="$PWD" \
    --config-file=/dev/null \
    --ignore test/cli_test.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
