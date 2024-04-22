# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Richard Quirk

pkgname=cmake-lint
pkgver=1.4.2
pkgrel=6
pkgdesc="Check for coding style issues in CMake files"
arch=(any)
url="https://github.com/cmake-lint/cmake-lint"
license=(Apache-2.0)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-pytest-runner
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  "python3.12-compatibility.patch"
)
sha256sums=(
  'bf060987c74e07890f7314a4832c2e54ffb9c5c1e6d799387bc438010f918676'
  '4f1573fa02d542067f0d20eb178f50354bed451173c4f73175098ca4c6e569c1'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/python3.12-compatibility.patch"
}

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
}
