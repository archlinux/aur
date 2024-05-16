# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: GI Jack <GI_Jack@hackermail.com>\

pkgname=python-rich-click
_pkgname=${pkgname#python-}
pkgver=1.8.2
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
sha256sums=('9a46f2e171cf662cfcc111e6be613f62d94e608ec92033f552bcd1646662ab87')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  # Deselected tests invoke the program via subprocesses which I wasn't able to
  # get working in the build environment.
  pytest --deselect tests/test_rich_click_cli.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
