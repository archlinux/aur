# Maintainer: niklassc <me@niklassc.xyz>

pkgname=blatt-git
pkgver=0.1.0.r21.g7c2ff2e
pkgrel=1
pkgdesc="Lightweight local RSS and Atom reader"
arch=('x86_64' 'aarch64')
url="https://github.com/niklassc-xyz/blatt"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=('blatt')
conflicts=('blatt')
source=('blatt::git+https://github.com/niklassc-xyz/blatt.git')
b2sums=('SKIP')
options=('!lto')

pkgver() {
    cd "$srcdir/blatt"
    local version
    version=$(awk -F '"' '/^version = / { print $2; exit }' Cargo.toml)
    printf '%s.r%s.g%s' \
        "$version" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/blatt"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/blatt"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/blatt"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$srcdir/blatt"
    install -Dm755 target/release/blatt "$pkgdir/usr/bin/blatt"
    install -Dm644 systemd/blatt.service \
        "$pkgdir/usr/lib/systemd/user/blatt.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 THIRD_PARTY_LICENSES.md \
        "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_LICENSES.md"
}
