# Maintainer: zodium-project
pkgname=zfetch-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast system fetch tool"
arch=('x86_64' 'aarch64')
url="https://github.com/zodium-project/zfetch"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("zfetch-rs::git+https://github.com/zodium-project/zfetch.git#branch=stable")
sha256sums=('SKIP')

pkgver() {
    cd "zfetch-rs"
    git tag | grep -E '^v[0-9]+\.[0-9]+\.[0-9]+$' | sort -V | tail -1 | sed 's/^v//'
}

prepare() {
    cd "zfetch-rs"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "zfetch-rs"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "zfetch-rs"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "zfetch-rs"
    install -Dm755 "target/release/zfetch" "$pkgdir/usr/bin/zfetch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 2>/dev/null || true
}
