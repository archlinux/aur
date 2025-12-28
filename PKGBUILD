# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry
pkgver=0.2.1
pkgrel=1
pkgdesc="A lightweight, owl-themed application launcher for Wayland"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'gtk4' 'gtk4-layer-shell')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('f38feb51d9282029a0545580c72a70f68954a3195fac1b5dcafa6e5a5641f1d5ebf3c6f4309e12e1eeb33ed9528941140cb9f1f336755b5a2ef2ce6173f2c0a3')

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
