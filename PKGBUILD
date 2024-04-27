# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-docopt-subcommands
_pkgname=${pkgname#python-}
pkgver=4.0.0
pkgrel=1
_commit=51e20890a6f7dfdce1f7556be2dd5fedb35a5fbf
pkgdesc="Create subcommand-based command-line programs with docopt"
arch=(any)
url="https://github.com/abingham/docopt-subcommands"
license=(MIT)
depends=(
  python
  python-docopt
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-pytest
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('277614a679607ef90e88a69f5b635013cf5d24a0ab45049e32e0e732ca9ed7b1')

_archive="$_pkgname-$_commit"

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
  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
