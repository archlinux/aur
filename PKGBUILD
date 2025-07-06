# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-color-parser-py
_name=${pkgname#python-}
pkgver=0.1.6
pkgrel=1
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
sha256sums=('c50fda032977bd69a6f06cbbe692ad65483e63165e1a08aad3adeacbe681a9d9')

prepare() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1
  python -m build --wheel --no-isolation
}

#check() {
#  cd "$_name-$pkgver"
#  pytest
#}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # LICENSE missing
#  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
