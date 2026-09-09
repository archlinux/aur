# Maintainer: boreq <boreq@0x46.net>
pkgname=nah-git
_pkgname=nah
pkgver=1.5.0.r7.g55b2b34
pkgrel=1
pkgdesc="Context aware safety guard for coding agents (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/manuelschipper/nah"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!lto')
source=("$_pkgname::git+https://github.com/manuelschipper/nah.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
        git describe --long --tags --abbrev=7 --match 'v[0-9]*' 2>/dev/null |
            sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "$_pkgname"
    # The repo pins an exact toolchain via rust-toolchain.toml; ignore it so the
    # build uses the system Rust instead of making rustup fetch its own copy.
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --package nah-cli
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release --package nah-cli
}

package() {
    cd "$_pkgname"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
