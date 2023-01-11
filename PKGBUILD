# Maintainer: timvisee <3a4fb3964f@sinenomine.email>
# Maintainer: orhun <orhunparmaksiz@gmail.com>
#
# Based on template. Changes made here will be overwritten each release.
# See: https://gitlab.com/timvisee/prs/-/tree/master/pkg/aur/prs

pkgname=prs
pkgver=0.4.1
pkgrel=1
pkgdesc="Secure, fast & convenient password manager CLI using GPG and git to sync"
arch=('x86_64' 'i686')
url="https://gitlab.com/timvisee/prs"
license=('GPL3')
depends=('gpgme' 'dbus' 'libxcb' 'libxkbcommon' 'skim')
makedepends=('cargo' 'python')
optdepends=('tomb: password store Tomb support')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('e9c6bd8f4fda20de21fce30a21f49d54c7b81ab60350649935ecbe3bd076fb7f7804bf1e58b5f98a8e68a5404b667127d70b0bcc2615fe5ff8658ee825541c9f')
_prs_cli_features=alias,clipboard,notify,backend-gpgme,select-skim-bin,tomb,totp

prepare() {
    cd "prs-v$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --package prs-cli --no-default-features --features $_prs_cli_features
}

check() {
    cd "$pkgname-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --package prs-cli --no-default-features --features $_prs_cli_features
}

package() {
    cd "$pkgname-v$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
