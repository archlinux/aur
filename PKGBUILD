# maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# ex-maintainer: timvisee <3a4fb3964f@sinenomine.email>
# ex-maintainer: orhun <orhunparmaksiz@gmail.com>
#
# Based on template. Changes made here will be overwritten each release.
# See: https://gitlab.com/timvisee/prs/-/tree/master/pkg/aur/prs

# shellcheck shell=bash
# shellcheck disable=SC2034,SC2164

pkgname=prs
pkgver=0.5.2
pkgrel=1
pkgdesc="Secure, fast & convenient password manager CLI using GPG and git to sync"
arch=('x86_64' 'i686')
url='https://gitlab.com/timvisee/prs'
license=('GPL3')
depends=('gpgme' 'dbus' 'libxcb' 'libxkbcommon' 'skim')
makedepends=('cargo' 'python')
optdepends=('tomb: password store Tomb support')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('93ca6f14c700b1a339e42b231b95b9b967eaf61976dd81eb11a40cce9b8c89e2e8074b22328233c5e341c0e10d5448f2afcc8b68a6e56acbf4c467c92fe53699')
_prs_cli_features=alias,clipboard,notify,backend-gpgme,select-skim-bin,tomb,totp

prepare() {
  cd "prs-v$pkgver"

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-v$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release --package prs-cli \
    --no-default-features --features "$_prs_cli_features"
}

check() {
  cd "$pkgname-v$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo test --frozen --package prs-cli \
    --no-default-features --features "$_prs_cli_features"
}

package() {
  cd "$pkgname-v$pkgver"

  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
