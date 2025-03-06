pkgname=ares-decrypt
pkgver=0.11.0
pkgrel=1
pkgdesc="Automated decoding of encrypted text without knowing the key or ciphers used."
arch=("x86_64")
url="https://github.com/bee-san/Ares"
license=("MIT")
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bee-san/Ares/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fd8751de6c46eb523d62d4ca52018b9127b9fa5fbd4a372b7f22e0f9957f030f')

prepare(){
    cd "$srcdir/Ares-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build(){
    cd "$srcdir/Ares-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}
check(){
    cd "$srcdir/Ares-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}
package(){
    cd "$srcdir/Ares-$pkgver"
    # It seems to be conflict with existing aur/ares package
    # However, they are not relative. Rename to avoid conflict
    install -Dm755 target/release/ares "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

