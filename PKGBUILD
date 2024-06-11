# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-jiter
_pkgname=${pkgname#python-}
pkgver=0.4.1
pkgrel=1
pkgdesc="Fast iterable JSON parser"
arch=(x86_64)
url="https://github.com/pydantic/jiter"
license=(MIT)
depends=(
  gcc-libs
  glibc
  python
)
makedepends=(
  python-build
  python-installer
  python-maturin
  python-wheel
)
checkdepends=(
  python-dirty-equals
  python-pytest
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a5c9b78426e4590151f78bb18464626e0e5b5443acd8209d4c7ad87f5e027c94')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive/crates/jiter-python"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive/crates/jiter-python"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" crates/jiter-python/dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
