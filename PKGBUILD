# Maintainer: Mahmoud Hanafy <mahmoud at hanafy dot dev>
pkgname=when-git
pkgver=0.4.0.r9.g98a2e62
pkgrel=1
pkgdesc='A timezone utility for the command line'
url='https://github.com/mitsuhiko/when'
license=('Apache')
makedepends=(cargo git)
depends=(gcc-libs)
arch=('x86_64')
source=(
    'when-git::git+https://github.com/mitsuhiko/when/#branch=main'
    'when-data::git+https://github.com/mitsuhiko/when-data/#branch=main'
)

sha512sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
    cd libwhen
    git submodule init
    git config submodule.libwhen-data.url "$srcdir/libwhen/data"
    git submodule update
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
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname/target/release/when"
}
