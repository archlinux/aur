# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-rtoml
pkgver=0.13
pkgrel=1
pkgdesc="A better TOML library for python implemented in rust."
arch=('x86_64')
url="https://pypi.org/project/rtoml"
license=('MIT')
depends=(python)
makedepends=(cargo maturin python-installer)
source=("$pkgname-$pkgver.tar.gz::https://github.com/samuelcolvin/rtoml/archive/v$pkgver.tar.gz")
sha256sums=('d67a8a23013ce4a1f2779a963ccb61a05d05d78edb290b65a476ccdc2f8f041f')
b2sums=('039428a450d0d0f9085f6abc87a158980f26e3408461deaa561acf025c22df9e4a2cd7028486484ae11390ccbd550c7eddfe3c073c13884f76f98b538536c9f9')

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
