pkgname=hath-rust
pkgdesc="Hentai@Home but rusty"
pkgver=1.3.0
pkgrel=1
arch=("x86_64")
url="https://github.com/james58899/hath-rust"
license=("GPL-3.0-only")
options=("!lto") # https://github.com/briansmith/ring/issues/1444
depends=("gcc-libs" "glibc")
makedepends=("cargo")
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "hath-rust.service"
    "hath-rust.tmpfiles"
    "hath-rust.sysusers"
)
sha256sums=('9479531c83a497e103f5d82ef5bceb7cd9b07cf3fc3b59a4ff558599d40f0f24'
            '7fb01a1563c431384a2e9fc7da1105650e63069e0ed634240e456d4456a0a73b'
            '4732b0b6683df5734e652e3d8c5875d90d48577cc46e579bdf43e656d3ca216e'
            '28b78e349e96777177e6f95f078c3d09fec0dcd174b1a70d5dc9b18e309b0a81')

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
    install -Dm644 "$srcdir/hath-rust.tmpfiles" \
        "$pkgdir/usr/lib/tmpfiles.d/hath-rust.conf"
    install -Dm644 "$srcdir/hath-rust.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/hath-rust.conf"
}
