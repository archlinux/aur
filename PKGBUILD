# Maintainer: Ricky Morabito <codericcardo@gmail.com>

pkgname=tokscale
pkgver=3.1.3
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
b2sums=('ccef28abc0e3920fa0ea95251ee733227e28cc605de7a414e2442452b8cc9db7eba544b8fb7c48581d4006b87c22b6e8f821f65cb9544eb940a16c54313acaaf')
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
