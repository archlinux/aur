# Maintainer: MopigamesYT <mopigames@proton.me>
pkgname=hytale-rpc-rs-git
pkgver=1.0.0.r0.g0000000
pkgrel=1
pkgdesc="Discord Rich Presence for Hytale - written in Rust"
arch=('x86_64')
url="https://github.com/MopigamesYT/hytale-rpc-rs"
license=('GPL3')
depends=('dbus')
makedepends=('git' 'cargo' 'rust')
provides=('hytale-rpc-rs')
conflicts=('hytale-rpc-rs' 'hytale-rpc-rs-bin')
source=("${pkgname}::git+https://github.com/MopigamesYT/hytale-rpc-rs.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "1.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/hytale-rpc" "$pkgdir/usr/bin/hytale-rpc"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
