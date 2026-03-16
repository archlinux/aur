# Maintainer: shiyi
pkgname=fd-rdd-git
_pkgname=vcp-fd-rdd
pkgver=0.4.7.r36.g50195f6
pkgrel=1
pkgdesc="Event-driven elastic file indexer with RDD lineage and glob support"
arch=('x86_64')
options=(!lto)
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
    local ver
    ver="$(grep -m1 '^version = "' Cargo.toml | cut -d'"' -f2)"
    printf "%s.r%s.g%s" \
        "$ver" \
        "$(git rev-list --count HEAD 2>/dev/null || echo 0)" \
        "$(git rev-parse --short HEAD 2>/dev/null || echo init)"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Strip LTO from CFLAGS — GCC LTO bitcode is incompatible with rust-lld
    CFLAGS="${CFLAGS//-flto=auto/}"
    CXXFLAGS="${CXXFLAGS//-flto=auto/}"
    cargo build --release --frozen
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/fd-rdd" "$pkgdir/usr/bin/fd-rdd"
    install -Dm755 "target/release/fd-rdd-query" "$pkgdir/usr/bin/fd-rdd-query"

    mkdir -p "$pkgdir/usr/lib/systemd/user/"
    sed 's|%h/.vcp/bin/fd-rdd|/usr/bin/fd-rdd|g' scripts/fd-rdd.service > "$pkgdir/usr/lib/systemd/user/fd-rdd.service"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
