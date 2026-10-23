# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Contributor: bahdotsh (upstream author)
pkgname=hopchat
pkgver=0.1.0
pkgrel=1
pkgdesc="Offline, end-to-end encrypted terminal chat for your local network. No server, no internet, no accounts."
arch=('x86_64' 'aarch64')
url="https://github.com/bahdotsh/hopchat"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bahdotsh/hopchat/archive/refs/tags/v$pkgver.tar.gz")
# Deliberately not SKIP: a fixed release tarball must be verified. Run
# `updpkgsums` after bumping pkgver (see ../README.md).
sha256sums=('65d164e10146fbf1cddfb75f20bbe0daa7c9cb13771270305c319f6c977b1087')

prepare() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/hopchat" "$pkgdir/usr/bin/hopchat"
  install -Dm644 packaging/hopchat.1 "$pkgdir/usr/share/man/man1/hopchat.1"
  install -Dm644 packaging/hopchat.desktop "$pkgdir/usr/share/applications/hopchat.desktop"
  install -Dm644 packaging/hopchat.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/hopchat.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
