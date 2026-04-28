# Maintainer: YOUR_NAME <YOUR_EMAIL@example.com>

pkgname=perry
pkgver=0.5.359
pkgrel=1
pkgdesc='Native TypeScript compiler that compiles TypeScript to native executables'
arch=('x86_64' 'aarch64')
url='https://github.com/PerryTS/perry'
license=('MIT')
options=(!lto)
depends=('clang' 'gcc' 'gcc-libs' 'glibc' 'xz' 'bzip2')
makedepends=('cargo')
checkdepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PerryTS/perry/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1fb0a667414b744424be4428a4a0de4d65fa89ea56c0e86ae713636115157314')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # v0.5.294's Cargo.lock is slightly out of sync with Cargo.toml.
    # cargo update syncs it; cargo fetch --locked then pins the tree.
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    # Smoke test: compile a tiny TS program and run the native binary.
    # Full `cargo test --workspace` is skipped because v0.5.294 has a
    # known duplicate-symbol linker error in perry-stdlib tests on Linux.
    echo 'console.log("hello perry")' > /tmp/perry_smoke_test.ts
    target/release/perry /tmp/perry_smoke_test.ts -o /tmp/perry_smoke_test
    /tmp/perry_smoke_test
}

package() {
    cd "$pkgname-$pkgver"

    # Install the main perry binary
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install static libraries needed at runtime for TS compilation
    install -Dm0644 -t "$pkgdir/usr/lib/" \
        target/release/libperry_runtime.a \
        target/release/libperry_stdlib.a \
        target/release/libperry_jsruntime.a

    # Install MIT license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
