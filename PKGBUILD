# Maintainer: shiyi
pkgname=fd-rdd-git
_pkgname=vcp-fd-rdd
pkgver=0.3.4
pkgrel=1
pkgdesc="Event-driven elastic file indexer with RDD lineage and glob support"
arch=('x86_64')
url="https://github.com/awei807-wei/vcp-fd-rdd"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('fd-rdd')
conflicts=('fd-rdd')
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    local _ver
    _ver=$(grep '^version' Cargo.toml | head -1 | sed 's/.*"\(.*\)".*/\1/')
    printf "%s.r%s.%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/fd-rdd" "$pkgdir/usr/bin/fd-rdd"

    mkdir -p "$pkgdir/usr/lib/systemd/user/"
    sed 's|%h/.vcp/bin/fd-rdd|/usr/bin/fd-rdd|g' scripts/fd-rdd.service > "$pkgdir/usr/lib/systemd/user/fd-rdd.service"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
