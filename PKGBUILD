# Maintainer: Ricky Morabito <codericcardo@gmail.com>

pkgname=tokscale-git
pkgver=4.7.0.r1847.g5972da38
pkgrel=1
pkgdesc='CLI tool and TUI for tracking token usage and costs from AI coding agents (development branch)'
arch=('x86_64')
url='https://github.com/junhoyeo/tokscale'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo' 'rust' 'openssl' 'pkg-config')
provides=('tokscale')
conflicts=('tokscale' 'tokscale-bin')
source=("$pkgname::git+https://github.com/junhoyeo/tokscale.git#branch=main")
b2sums=('SKIP')
options=(!lto)

pkgver() {
    cd "$srcdir/$pkgname"
    printf "%s.r%s.g%s" \
        "$(git describe --tags --abbrev=0 | sed 's/^v//')" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    sed -i 's/native-tls-vendored/native-tls/g' Cargo.toml crates/*/Cargo.toml
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTFLAGS='-C linker-features=-lld -C link-arg=-Wl,--copy-dt-needed-entries'
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/tokscale" "$pkgdir/usr/bin/tokscale"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
