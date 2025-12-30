# SPDX-License-Identifier: MIT OR AGPL-3.0-or-later
# Maintainer: hyperpolymath <packages@hyperpolymath.dev>
# Contributor: Vext Contributors

pkgname=vext
pkgver=1.0.0
pkgrel=1
pkgdesc='High-performance IRC notification daemon for version control systems'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperpolymath/vext'
license=('MIT' 'AGPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'rust')
provides=('vextd' 'vext-send')
conflicts=('vext-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hyperpolymath/vext/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --package vext-core
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --package vext-core
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/vextd" "$pkgdir/usr/bin/vextd"
  install -Dm755 "target/release/vext-send" "$pkgdir/usr/bin/vext-send"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.adoc" "$pkgdir/usr/share/doc/$pkgname/README.adoc"

  # Man pages
  if [[ -d "man" ]]; then
    install -Dm644 "man/vextd.1" "$pkgdir/usr/share/man/man1/vextd.1"
    install -Dm644 "man/vext-send.1" "$pkgdir/usr/share/man/man1/vext-send.1"
  fi
}
