# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-calamine
pkgver=0.7.0
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
sha256sums=('c317c9e1c5aa6da951f476b6d76b8cd527f4cf97b1fd7bd1b17dbda02420fedf')

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
