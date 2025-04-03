# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-calamine
pkgver=0.3.2
pkgrel=1
pkgdesc="Python binding for a library for reading excel and odf file: calamine"
arch=(x86_64)
url="https://github.com/dimastbk/python-calamine"
license=(MIT)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-maturin
  python-wheel
)
checkdepends=(
  python-pytest
)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d9ac2d104fe18acf56900373d7598090a6e35a964b1e3973c22ed5b9f076ac8f')

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl
  PYTHONPATH="$PWD/tmp_install/$site_packages" pytest tests -k 'not test_xlsb_pyxlsb_pandas'
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
