# Maintainer: Quintus Leung <quintusl@gmail.com>
pkgname=rusty-socks
pkgver=0.1.0
pkgrel=1
pkgdesc="A high-performance SOCKS5 and HTTP proxy server written in Rust with journald support"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/quintusl/rusty-socks"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
backup=('etc/rusty-socks/config.yml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

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
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    # Install systemd service
    install -Dm0644 config/rusty-socks.service "$pkgdir/usr/lib/systemd/system/rusty-socks.service"

    # Install configuration
    install -Dm0644 config/config.yml.journald.example "$pkgdir/etc/rusty-socks/config.yml"
    install -Dm0664 config/users.yml.example "$pkgdir/etc/rusty-socks/users.yml"

    # Create directories
    install -dm0755 "$pkgdir/var/log/rusty-socks"

    # Install documentation
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm0644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm0644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
