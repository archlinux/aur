# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=mdbook-i18n-helpers
pkgver=0.4.0
pkgrel=1
pkgdesc="Gettext translation support for mdbook"  
arch=(x86_64)
url="https://github.com/google/mdbook-i18n-helpers"
license=('Apache-2.0')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('82a64b6c27dc99a20968cc85a89dcfe0d36f82e2c9bc3b4342a2ffc55158822f')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver

    install -Dm755 target/release/mdbook-gettext "$pkgdir"/usr/bin/mdbook-gettext
    install -m755  target/release/mdbook-xgettext "$pkgdir"/usr/bin/mdbook-xgettext
    install -m755  target/release/mdbook-i18n-normalize "$pkgdir"/usr/bin/mdbook-i18n-normalize

    install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG.md
    install -m644  README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
    install -m644  USAGE.md "$pkgdir"/usr/share/doc/$pkgname/USAGE.md
}
