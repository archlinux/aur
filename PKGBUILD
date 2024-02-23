# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=mdbook-i18n-helpers
pkgver=0.3.2
pkgrel=1
pkgdesc="Gettext translation support for mdbook"  
arch=(x86_64)
url="https://github.com/google/mdbook-i18n-helpers"
license=('Apache-2.0')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('4c3476ecdd1713de7eac3cf3aa20ae8206a6dfbde2d5e6736d7bc7e35a78a2cf')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    # Fails when -flto is set without -ffat-lto-objects
    export CFLAGS+=' -ffat-lto-objects'
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
