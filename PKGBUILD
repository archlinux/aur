# Maintainer: Yasir Hassan <yasir@yaasir.dev>
pkgname=soplang-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="The Somali Programming Language (Rust/Cranelift JIT implementation, tracks main)"
arch=('x86_64' 'aarch64')
url="https://github.com/soplang/soplang"
license=('MIT')
provides=('soplang')
conflicts=('soplang')
makedepends=('cargo' 'git')
source=("$pkgname::git+https://github.com/soplang/soplang.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "%s.r%s.g%s" \
        "$(grep -m1 '^version' Cargo.toml | cut -d '"' -f2)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname"
    cargo test --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/soplang" "$pkgdir/usr/bin/soplang"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
