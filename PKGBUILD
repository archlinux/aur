# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: GI Jack <GI_Jack@hackermail.com>\

pkgname=python-rich-click
_pkgname=${pkgname#python-}
pkgver=1.8.5
pkgrel=1
pkgdesc="Python module to format click help output nicely with Rich."
arch=(any)
url="https://github.com/ewels/rich-click"
license=(MIT)
depends=(
  python
  python-click
  python-rich
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7a0bdc65b08bbff5c65e1d72407a1a9c74bfd876a82e949e14f8dc05a9b1a0cc')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest -vv

  # Deselected tests invoke the program via subprocesses which I wasn't able to
  # get working in the build environment.
  # pytest --deselect tests/test_rich_click_cli.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
