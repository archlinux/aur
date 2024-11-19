# Maintainer: aarto <aarto@archlinux.org>
pkgname=mtracker
pkgver=0.5.0
pkgrel=1
pkgdesc='cli movie tracker - keep track of watched movies and series'
url='https://github.com/r-unruh/mtracker'
license=('MIT')
arch=('x86_64' 'armv7h' 'aarch64')
makedepends=(cargo)
provides=('mtracker')
conflicts=('mtracker')
source=("https://github.com/r-unruh/mtracker/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('cfa106ff76fe92e1307b3ebd485cc9c248a5fb23cae978ef322f277009004e3358d1c62ea506e8ea03791ff45b7344fe438d590eb875d17fed1f16a18fcc0ff6')

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
