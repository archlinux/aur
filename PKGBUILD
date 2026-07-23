# Maintainer: Ricky Morabito <codericcardo@gmail.com>

pkgname=tokscale
pkgver=4.7.0
pkgrel=1
pkgdesc='CLI tool and TUI for tracking token usage and costs from AI coding agents'
arch=('x86_64')
url='https://github.com/junhoyeo/tokscale'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'rust' 'openssl' 'pkg-config')
provides=('tokscale')
conflicts=('tokscale-bin' 'tokscale-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/junhoyeo/tokscale/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('6e9bdfe6fa1de12b5bf8da496848aadcb139a24a6f30b9fad8b4f2c2ea7186faea8618efdca890e069fdf2ea16a86b1718479d951775a516cfa22fb6fd998c31')
options=(!lto)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i 's/native-tls-vendored/native-tls/g' Cargo.toml crates/*/Cargo.toml
    cargo fetch
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTFLAGS='-C linker-features=-lld -C link-arg=-Wl,--copy-dt-needed-entries'
    cargo build --release
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTFLAGS='-C linker-features=-lld -C link-arg=-Wl,--copy-dt-needed-entries'
    cargo test --workspace
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
