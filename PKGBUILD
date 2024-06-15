# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-jiter
_pkgname=${pkgname#python-}
pkgver=0.4.2
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
sha256sums=('3308f266e77b72bb4e5766a1d4a1765ebed757c52eb5bccf37617e7b032850ae')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive/crates/jiter-python"

  export RUSTUP_TOOLCHAIN=stable
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
