# Maintainer: Jian Wei Cheong <aur at jianwei dot anonaddy dot com>

pkgname=bibiman
pkgver=0.17.1
pkgrel=1
pkgdesc='A TUI for fast and simple interacting with your BibLaTeX database.'
url='https://codeberg.org/lukeflo/bibiman'
license=('GPL-3.0-or-later')
makedepends=('cargo')
provides=('bibiman')
conflicts=('bibiman-bin' 'bibiman-git')
arch=('x86_64')
options=(!debug !lto)
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/lukeflo/bibiman/archive/v$pkgver.tar.gz")
b2sums=('d2728129d49f6af5e4f5931fbbd8cf1b6f215695e330c7a36971db1aeeff425e7767350524b60839bf10afd98ec264ca2cee2cce2e519cdc87a9364cc3b53e79')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $pkgname
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname
    cargo test --frozen --all-features
}

package() {
    cd $pkgname
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
