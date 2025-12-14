# Maintainer: Jian Wei Cheong <aur at jianwei dot anonaddy dot com>

pkgname=bibiman
pkgver=0.18.3
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
b2sums=('6a5fe93b41b890ae3664d9c99fed97b2a4f7cc8dc5f9852c757c01f962552c9719623dfc839d6d90e55027f58fb8850c05e3de7454ddfb241092d15b7f9343b5')

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

# check() {
#     export RUSTUP_TOOLCHAIN=stable
#     cd $pkgname
#     cargo test --frozen --all-features
# }

package() {
    cd $pkgname
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    install -Dm644 "man/bibiman.1" "$pkgdir/usr/share/man/man1/bibiman.1"
    install -Dm644 "man/bibiman.toml.5" "$pkgdir/usr/share/man/man5/bibiman.toml.5"
}
