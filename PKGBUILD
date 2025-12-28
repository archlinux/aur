# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry
pkgver=0.3.4
pkgrel=1
pkgdesc="A lightweight, owl-themed application launcher for Wayland"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'gtk4' 'gtk4-layer-shell')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('33820fb84cf7d315ff0f9b0db749d6788254146898e4f548945c9fd53fc3b80772fcc1e65ff9d6f177054c1ceba5b35e6a510af6a516f3728d5ee4393aa3799d')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
    cd "$pkgname"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 config.example.toml "$pkgdir/usr/share/doc/$pkgname/config.example.toml"

    # Install example themes
    install -d "$pkgdir/usr/share/$pkgname/themes"
    install -Dm644 themes/*.css "$pkgdir/usr/share/$pkgname/themes/"
}
