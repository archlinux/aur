# Maintainer: Ricky Morabito <codericcardo@gmail.com>

pkgname=tokscale
pkgver=4.2.0
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
b2sums=('37e8ddc2fc48e88bbb0c2686dcedc054e1f71f55a05f6911b2b98ee7285f531f6b072ad80f1f5bba976106578c06eb723827ea377d399cf1bcbc41ceeb3a744d')
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
