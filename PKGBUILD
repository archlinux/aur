# Maintainer: Sarvjeet Singh <sarvjeet@gmail.com>
pkgname=python-pyxirr
_name=pyxirr
pkgver=0.10.8
pkgrel=1
pkgdesc="Rust-powered collection of financial functions (XIRR, XNPV, IRR, etc.)"
arch=('x86_64' 'aarch64')
url="https://github.com/Anexen/pyxirr"
license=('Unlicense')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-maturin' 'rust')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a5620dd76015444f26f805c4983a41664898fbf2a74956a28589b171ed96d2f5')

prepare() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  # Download crates now, so build() can run without fetching anything
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_name-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
