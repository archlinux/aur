pkgname=hath-rust
pkgdesc="The unofficial Hentai@Home client written in Rust"
pkgver=1.17.0
pkgrel=1
arch=("x86_64")
url="https://github.com/james58899/hath-rust"
license=("GPL-3.0-or-later")
options=("!lto") # https://github.com/briansmith/ring/issues/1444
depends=("libgcc" "glibc" "jemalloc")
makedepends=("cargo" "git")
source=("git+$url.git#tag=v$pkgver"
        "hath-rust.service")
sha256sums=('c999c3ce1ced6d3836992c80586a562c9a4de047f2a976b234189fe1440e8c44'
            '8e918cb227da548a9c4b184c487f4cf416b7d6fe5e191e7fc34985acb8044275')

prepare() {
    cd "$srcdir/hath-rust"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}
build() {
    cd "$srcdir/hath-rust"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export JEMALLOC_OVERRIDE=/usr/lib/libjemalloc.so
    cargo build --frozen --release --all-features
}
check() {
    cd "$srcdir/hath-rust"
    export RUSTUP_TOOLCHAIN=stable
    export JEMALLOC_OVERRIDE=/usr/lib/libjemalloc.so
    cargo test --frozen --all-features
}
package() {
    cd "$srcdir/hath-rust"
    install -Dm755 "target/release/hath-rust" \
        "$pkgdir/usr/bin/hath-rust"
    install -Dm644 "$srcdir/hath-rust.service" \
        "$pkgdir/usr/lib/systemd/system/hath-rust.service"
}
