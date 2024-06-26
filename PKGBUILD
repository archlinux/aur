# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-rtoml
pkgver=0.11
pkgrel=1
pkgdesc="A better TOML library for python implemented in rust."
arch=('x86_64')
url="https://pypi.org/project/rtoml"
license=('MIT')
depends=(python)
makedepends=(cargo maturin python-installer)
source=("$pkgname-$pkgver.tar.gz::https://github.com/samuelcolvin/rtoml/archive/v$pkgver.tar.gz")
sha256sums=('6036657a0820eccc555c798287cbe78e66bc1a7a5882853f2b99ce97f9c53622')
b2sums=('cf9dd7440a52e6c69ab586682c3094a5743dddc4ce4e654af486b49442d86fced8368a2e8208a23a563b272600805bfb368a499a6598e20778b232d7f7516aa8')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "rtoml-$pkgver"

  cargo fetch --locked
}

build() {
  cd "rtoml-$pkgver"

  CFLAGS="$CFLAGS -fPIC" \
    maturin build --locked --release
}

package() {
  cd "rtoml-$pkgver"

  python -m installer --destdir="$pkgdir" target/wheels/*.whl
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
