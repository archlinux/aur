# Maintainer: Edgar Vincent <e-v@posteo.net>
_pkgname=signal-rs
pkgname=${_pkgname}-git
pkgver=r76.fe8c162
pkgrel=3
pkgdesc="A Rust-based Signal app with a QML/Kirigami frontend."
arch=('x86_64' 'aarch64')
url="https://sr.ht/~nicohman/signal-rs/"
license=('GPL3')
depends=('qt5-webengine')
makedepends=('git' 'cargo-nightly' 'qt5-webengine' 'kirigami2')
provides=(signal-rs)
source=("git+https://git.sr.ht/~nicohman/signal-rs" "signal-rs.desktop")
sha256sums=('SKIP'
            'ad3e71a3d6af08ee33c58c884bb097426b34aebe87add0f6fca57cf24d2864cd')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=nightly
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=nightly
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname/target/release/$_pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/applications/" "${srcdir}/signal-rs.desktop"
}

# vim:set ts=2 sw=2 et:
