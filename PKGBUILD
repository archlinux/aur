# Maintainer: Ketchup901 <ketchup901@riseup.net>

# IMPORTANT: You must follow the instructions at https://wiki.archlinux.org/title/Radicle in order to be able to download the source for this package!

pkgname=lcp-dedrm-git
pkgver=0.1.1.r9.7a6aa9c
pkgrel=1
pkgdesc="LCP DRM removal tool"
arch=('any')
url=""
license=()
provides=('lcp-dedrm')
conflicts=('lcp-dedrm')
makedepends=(
    'radicle'
    'git'
    'cargo'
)
depends=(
    'glibc'
    'libgcc'
    'zstd'
)
source=("lcp-dedrm::git+rad://z41uCZqyBUSRQoBCQq4Bpq8ZSCHKr")
sha256sums=('SKIP')
options=(!lto)

pkgver() {
    cd lcp-dedrm
    _version=$(sed -nE 's/^version = "(.*)"$/\1/p' Cargo.toml)
    _rev=$(git rev-list --count HEAD)
    _commit=$(git rev-parse --short=7 HEAD)
    printf "%s.r%s.%s" "$_version" "$_rev" "$_commit"
}

prepare() {
    cd lcp-dedrm
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd lcp-dedrm
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export ZSTD_SYS_USE_PKG_CONFIG=1
    # Remove optimization flags, otherwise build breaks
    export CFLAGS="${CFLAGS//-O[^[:space:]]*/}"
    cargo build --frozen --release
}

package() {
    install -Dm755 "$srcdir/lcp-dedrm/target/release/lcp-dedrm" -t "$pkgdir/usr/bin/"
}

