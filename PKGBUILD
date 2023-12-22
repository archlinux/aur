# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-rtoml
pkgver=0.10
pkgrel=1
pkgdesc="A better TOML library for python implemented in rust."
arch=('x86_64')
url="https://pypi.org/project/rtoml"
license=('MIT')
depends=(python)
makedepends=(cargo maturin python-installer)
source=("$pkgname-$pkgver.tar.gz::https://github.com/samuelcolvin/rtoml/archive/v$pkgver.tar.gz")
sha256sums=('a756c0478ee69b2dc5239bac2593514f4e632b2d0be80e7c39639ecfe5ca9dcd')
b2sums=('79987fef17e27f51c48087d39d1de38b6604a97fe378b43fdfae8e9c2fb31f2626c37abd04ff8842d39fc80c62a3d03c9685d27e0662063101645f5cc6b06d59')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "rtoml-$pkgver"

  cargo fetch --locked
}

build() {
  cd "rtoml-$pkgver"

  CFLAGS="$CFLAGS -fPIC" \
    maturin build --frozen --release
}

package() {
  cd "rtoml-$pkgver"

  python -m installer --destdir="$pkgdir" target/wheels/*.whl
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
