# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-rtoml
pkgver=0.14
pkgrel=1
pkgdesc="A better TOML library for python implemented in rust."
arch=('x86_64')
url="https://pypi.org/project/rtoml"
license=('MIT')
depends=(python)
makedepends=(cargo maturin python-installer)
source=("$pkgname-$pkgver.tar.gz::https://github.com/samuelcolvin/rtoml/archive/v$pkgver.tar.gz")
sha256sums=('4df2cce65d90fa1b8446cd235b518ad6f44a06b6f3d9c846a649103233134289')
b2sums=('c5f255d6109bd5c4c8857c7c1a4a6ca9726cb984a9db7e3eddcd757b83c3248813e1e09a5106fbd1f829f3070e324900ea09aeafe5341c3e913046f63ac2b75d')

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
