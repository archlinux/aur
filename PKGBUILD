# Maintainer: aarto <aarto@archlinux.org>
pkgname=mtracker
pkgver=0.7.0
pkgrel=1
pkgdesc='cli movie tracker - keep track of watched movies and series'
url='https://github.com/r-unruh/mtracker'
license=('MIT')
arch=('x86_64' 'armv7h' 'aarch64')
options=(!lto)
depends=(glibc libgcc)
makedepends=(cargo)
provides=('mtracker')
conflicts=('mtracker')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/r-unruh/mtracker/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('79af9c24e33b7a4afa0e41982101c26c4e3d6ce4cbe82fc606f3c97f6c58a1fded83ffec87fba32f6c95163cf57e0f8793c63cc4b1efde9d8d877b31e20d372d')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Shell autocompletion scripts
    install -Dm644 completions/bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 completions/zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
