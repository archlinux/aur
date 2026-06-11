# Maintainer: Zonda Yang <u226699@gmail.com>
pkgname=magic-pack
pkgver=0.12.0
pkgrel=1
pkgdesc="A CLI tool for compressing and decompressing files with multiple formats"
arch=('x86_64' 'aarch64')
url="https://github.com/zondatw/magic-pack"
license=('MIT')
depends=('zstd')
makedepends=('rust' 'cargo' 'zstd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zondatw/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c661860c8e0762c121833e5206a5586b50c1a0ed74bb4e1237b474effe807f72')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C linker=cc"
    export ZSTD_SYS_USE_PKG_CONFIG=1
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/magic-pack" "$pkgdir/usr/bin/magic-pack"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
