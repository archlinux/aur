# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: GI Jack <GI_Jack@hackermail.com>\

pkgname=python-rich-click
_pkgname=${pkgname#python-}
pkgver=1.8.1
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
sha256sums=('2f2c250a5ad3fac19da366fed10be4174fb3c7fec2ad5e352d2e35bed55b7df1')

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
