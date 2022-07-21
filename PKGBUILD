# Maintainer: Mik Mueller <imse335@gmail.com>
pkgname=smarthome-commander
pkgver=0.2.0
pkgrel=3
pkgdesc="Microservice for executing shell commands via API requests"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/smarthome-go/commander"
license=('GPL2')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/smarthome-go/commander/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ddf4f04b4dd2206e6eab906a29997bad10c0682fb5fa70585f255af7ac17482cc4369bb4a53cb0a47fd2ff4a07b151df7d70549d623caa06c1c188360a5ea6a9')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sudo install -Dm644 "commander@.service" "/etc/systemd/system"
    sudo systemctl daemon-reload
}
