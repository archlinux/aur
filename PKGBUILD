# Maintainer: Soc Virnyl S. Estela <renegan.ronin@gmail.com>
# Maintainer: Peter Kaplan <aur@pkap.de>

pkgname=ristate
pkgver=0.1.0
pkgrel=1
pkgdesc="A river-status client"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://gitlab.com/snakedye/ristate"
license=('MIT')
makedepends=('git' 'rust')
source=(
    "${pkgname}::git+$url"
)
sha256sums=(
    'SKIP'
)
provides=("ristate")
conflicts=("ristate")

pkgver() {
    cd "${pkgname}"
    awk -F\" '/^version/ { print $2; exit }' Cargo.toml
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target $CARCH-unknown-linux-gnu

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
    cargo test --frozen
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}"
}
