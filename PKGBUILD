# Maintainer: Dustin <dustin.pilgrim1997@gmail.com>

pkgname=dstl
pkgver=0.2.0
pkgrel=1
pkgdesc="A fast, keyboard-driven TUI application launcher with fuzzy search"
arch=('x86_64')
url="https://github.com/saltnpepper97/dstl"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('00576b99dea17ac7afb743a1aca5beb618041f710a9914472e7a47223d999343')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Install example config
    install -Dm644 "examples/dstl.rune" "$pkgdir/usr/share/doc/$pkgname/dstl.rune"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
