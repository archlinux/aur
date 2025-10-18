pkgname=hath-rust
pkgdesc="Hentai@Home but rusty"
pkgver=1.13.0
pkgrel=1
arch=("x86_64")
url="https://github.com/james58899/hath-rust"
license=("GPL-3.0-only")
options=("!lto") # https://github.com/briansmith/ring/issues/1444
depends=("gcc-libs" "glibc")
makedepends=("cargo" "git")
source=("git+$url.git#tag=v$pkgver"
        "hath-rust.service")
sha256sums=('ce592cf585cf3bce0ed11a9f9614f3be23197653a6fee79cee9b5f102e4cde1c'
            '20a8a8f2d6f9895fb983125e58ad17a9e6509a1e616b58cabab7efbfde4a356c')

prepare() {
    cd "$srcdir/hath-rust"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
build() {
    cd "$srcdir/hath-rust"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}
package() {
    cd "$srcdir/hath-rust"
    install -Dm755 "target/release/hath-rust" \
        "$pkgdir/usr/bin/hath-rust"
    install -Dm644 "$srcdir/hath-rust.service" \
        "$pkgdir/usr/lib/systemd/system/hath-rust.service"
}
