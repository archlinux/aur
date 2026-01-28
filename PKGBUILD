# Maintainer: Will McCracken <tsa@lattefiend.com>
pkgname=tsa
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI tool for managing Tailscale devices and users"
arch=('x86_64' 'aarch64')
url="https://github.com/wmccracken/tsa"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
options=(!debug !lto)
optdepends=('tailscale: required for signing locked-out devices')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wmccracken/tsa/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5d7994889717c1580f9a67aab19d59ab20d5238ef4e27a8e14bdc6991f366d52')

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
    export CARGO_TARGET_DIR=target
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
