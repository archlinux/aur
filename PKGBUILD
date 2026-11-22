# Maintainer: gilcu3
# Contributor: gilcu3

pkgname=nano-lean
pkgver=0.4.2
pkgrel=1
pkgdesc='Small parallel Lean 4 type checker based on unbound de Bruijn indices'
arch=('x86_64' 'aarch64')
url='https://github.com/sdiehl/nano-lean'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
# libmimalloc-sys and blake3 bundle C code; the binaries still get Rust's own fat LTO
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('687b8f9197c014913b21488401f8aee798f59ef1ed662bd7ccade8599346bb555508455be0fbc90d5707bfc5b958b7f50e9544be686fe90b9ed0082cd4c6856c')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    # makepkg's RUSTFLAGS and CFLAGS take precedence over upstream's .cargo/config.toml, re-add its values
    export RUSTFLAGS+=' -C llvm-args=-align-all-functions=6'
    export CFLAGS+=' -DMI_NO_GETENV'
    # all upstream features are debugging aids (profile, vstats, memocheck, derivecheck)
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
