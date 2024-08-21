pkgname=hath-rust
pkgdesc="Hentai@Home but rusty"
pkgver=1.7.1
pkgrel=1
arch=("x86_64")
url="https://github.com/james58899/hath-rust"
license=("GPL-3.0-only")
options=("!lto") # https://github.com/briansmith/ring/issues/1444
depends=("gcc-libs" "glibc")
makedepends=("cargo")
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    "hath-rust.service"
    "hath-rust.hook"
)
sha256sums=('648c7ff81a7d6547dcdc244af7d4ad5eb9c8c36e8f441e52477bd42c4ba8d38b'
            'cf8f40f31df60aae98d57b3044a0dd01c23d1457cd64b1478be8cae7cf19dbd5'
            '19be3ff60b1eb244b824e085da1101c0c1e8120d865b035139d712b0e864b025')

prepare() {
    cd "$srcdir/hath-rust-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
    cd "$srcdir/hath-rust-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}
check() {
    cd "$srcdir/hath-rust-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --all-features
}
package() {
    cd "$srcdir/hath-rust-$pkgver"
    install -Dm755 "target/release/hath-rust" \
        "$pkgdir/usr/bin/hath-rust"
    install -Dm644 "$srcdir/hath-rust.service" \
        "$pkgdir/usr/lib/systemd/system/hath-rust.service"
    install -Dm644 "$srcdir/hath-rust.hook" \
        "$pkgdir/usr/share/libalpm/hooks/hath-rust.hook"
}
