# Maintainer: timvisee <3a4fb3964f@sinenomine.email>
# Maintainer: orhun <orhunparmaksiz@gmail.com>
#
# Based on template. Changes made here will be overwritten each release.
# See: https://gitlab.com/timvisee/prs/-/tree/master/pkg/aur/prs-git

pkgname=prs-git
pkgver=0.4.0.r0.gd8db08a
pkgrel=1
pkgdesc="Secure, fast & convenient password manager CLI using GPG and git to sync (git)"
arch=('x86_64' 'i686')
url="https://gitlab.com/timvisee/prs"
license=('GPL3')
depends=('gpgme' 'dbus' 'libxcb' 'libxkbcommon' 'skim')
makedepends=('cargo' 'python' 'git')
optdepends=('tomb: password store Tomb support')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')
_prs_cli_features=alias,clipboard,notify,backend-gpgme,select-skim-bin,tomb,totp

pkgver() {
    cd "${pkgname%-git}"

    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname%-git}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --package prs-cli --no-default-features --features $_prs_cli_features
}

check() {
    cd "${pkgname%-git}"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --package prs-cli --no-default-features --features $_prs_cli_features
}

package() {
    cd "${pkgname%-git}"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
    install -Dm0644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
