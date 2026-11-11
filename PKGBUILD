# Maintainer: Amin Vakil <info AT aminvakil DOT com>

pkgname=python-wreq
pkgver=0.13.0
pkgrel=1
pkgdesc="An ergonomic, privacy-aware Python HTTP Client"
arch=('x86_64')
url="https://github.com/0x676e67/wreq-python"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'python')
makedepends=(
  'cargo'
  'clang'
  'cmake'
  'git'
  'python-build'
  'python-installer'
  'python-maturin'
)
options=('!lto')
source=("https://files.pythonhosted.org/packages/source/w/wreq/wreq-${pkgver}.tar.gz")
sha512sums=('0ab03d1753c94bbefa00756166cd24d0dfe896a41b3f995d05b48e610983aa78c8c273e9618cb6bacb7d773e44050c290a3155ccd2826814a794d67381576bcb')

prepare() {
  cd "wreq-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "wreq-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CARGO_PROFILE_RELEASE_STRIP=false
  python -m build --wheel --no-isolation -Cbuild-args="--frozen --target $(rustc --print host-tuple)"
}

package() {
  cd "wreq-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
