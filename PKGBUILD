# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi dot com>

pkgname=edgee
pkgver=0.9.0
pkgrel=1
pkgdesc='The full-stack edge platform for your edge oriented applications'
arch=('x86_64')
url='https://www.edgee.cloud'
license=('Apache-2.0')
depends=('openssl' 'bzip2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/edgee-cloud/edgee/archive/v$pkgver.tar.gz")
sha256sums=('aff6a4a3f7cf0b8d97acc868b03a0498e1f7cd7114640c5b66d1ae17de95296a')
b2sums=('c294570991ffb5584e5432b067f5fc7a4c2fd784e266fa3548b73ded88260a9ceed1b3b3357be5f5ac1f0fa597980df0d69eab773799f76042a5c1a4eae6c573')
options=('!lto')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"

  CARGO_TARGET_DIR=target \
  cargo build --frozen --release --package edgee --bin edgee
}

check() {
  cd "$pkgname-$pkgver"

  RUSTFLAGS="$RUSTFLAGS -C debug-assertions" cargo test --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin" target/release/edgee

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE
}
