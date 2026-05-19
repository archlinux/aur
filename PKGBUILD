# Maintainer: Joseph R. Quinn <quinn.josephr@protonmail.com>
pkgname=bitbucket-cli
pkgver=0.3.14
pkgrel=1
pkgdesc="A powerful command-line interface for Bitbucket Cloud - manage repos, PRs, issues, and pipelines from your terminal with OAuth 2.0"
arch=('x86_64' 'aarch64')
url="https://github.com/pegasusheavy/bitbucket-cli"
license=('MIT')
depends=('dbus' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=(
    'gnome-keyring: store credentials in GNOME Keyring via Secret Service'
    'kwallet: store credentials in KDE Wallet via Secret Service'
)
provides=('bitbucket')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pegasusheavy/bitbucket-cli/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4e480de12aecb11d04f8c2ce3c312dbe4c1c150cc26a18b324cdaacc4c109af1')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/bitbucket" "$pkgdir/usr/bin/bitbucket"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
