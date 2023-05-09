# Maintainer: CarbonSmasher <crabonsmasher@gmail.com>

_pkgbase=mcvm
pkgname="${_pkgbase}-git"
pkgver=r199.3d1dfd6
pkgrel=1
pkgdesc="A Minecraft version manager and launcher"
arch=('x86_64')
url="https://github.com/CarbonSmasher/mcvm"
license=('GPL')
makedepends=('git' 'cargo')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("${_pkgbase}::git+https://github.com/CarbonSmasher/mcvm.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgbase}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${_pkgbase}"
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/${_pkgbase}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/${_pkgbase}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/${_pkgbase}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgbase}"
}

