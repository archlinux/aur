# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-color-parser-py
_name=${pkgname#python-}
pkgver=0.1.7
pkgrel=3
pkgdesc="Python bindings for CSS color parser using PyO3. Parse and convert colors between different formats."
arch=('x86_64')
url="https://github.com/rusiaaman/color-parser-py"
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-maturin'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('412972305eea55bf7c5af3d1da3e632456f6c7128c676a0472c723dfbd7509c1')

prepare() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target host-tuple
}

build() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -I -m pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # LICENSE missing
#  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
