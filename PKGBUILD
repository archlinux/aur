# Maintainer: Ricky Morabito <codericcardo@gmail.com>

pkgname=tokscale
pkgver=4.0.6
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
b2sums=('24223f7fabf3cbafd49272f48008d9738a8cfd51b564f0dc57b78b096c44a3fc0dfbf3a852370b9fc33373f27e1f2b662f14fffa262a4251bbe486156fe8129a')
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
