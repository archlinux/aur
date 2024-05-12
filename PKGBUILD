# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Richard Quirk

pkgname=cmake-lint
pkgver=1.4.3
pkgrel=1
pkgdesc="Check for coding style issues in CMake files"
arch=(any)
url="https://github.com/cmake-lint/cmake-lint"
license=(Apache-2.0)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('7a2be3b179c565373cb7ccfe3076b0d1fa051f2234b52e29f69fa386042ebb74')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation --skip-dependency-check
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
