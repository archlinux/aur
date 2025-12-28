# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry
pkgver=0.1.2
pkgrel=1
pkgdesc="A lightweight, owl-themed application launcher for Wayland"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'gtk4' 'gtk4-layer-shell')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('99104f4abb34591de24607ee6577e895489a70f8d935d684be626ddd44652bf5322557693569a2e6f0dba95e931f2ac2060bf820d0bc02daba3c8fd311d65263')

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
}
