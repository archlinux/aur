# Maintainer: Jian Wei Cheong <aur at jianwei dot anonaddy dot com>

pkgname=bibiman
pkgver=0.19.4
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
b2sums=('3b16ddbe0e4f58c7d9b4ce53b00035d855cdb5aeed6c86dc4c31826b6392227be51d055313d5174ae863c0e70cb727741e22ff92604686d32ca67ea1367d6849')

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

    install -Dm644 "man/bibiman.1" "$pkgdir/usr/share/man/man1/bibiman.1"
    install -Dm644 "man/bibiman.toml.5" "$pkgdir/usr/share/man/man5/bibiman.toml.5"
}
