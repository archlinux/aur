# Maintainer: Mik Mueller <imse335@gmail.com>
pkgname=smarthome-commander
pkgver=0.2.1
pkgrel=5
pkgdesc="Microservice for executing shell commands via API requests"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/smarthome-go/commander"
license=('GPL2')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/smarthome-go/commander/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('36590de9c7f31a5d17dad443759155fc53bf9efc6e6cdb4467745c769b18c05df4f8bd74918d2586182cdda53b069b644a76949418abf21988a50d3239402383')

prepare() {
    cd "$srcdir/commander-$pkgver"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/commander-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/commander-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/commander"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "commander@.service" "/etc/systemd/system"
    systemctl daemon-reload
}
