# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>
pkgname=pass-systemd-cred-server
pkgver=0.1.0
pkgrel=1
pkgdesc="systemd credential server backed by zx2c4's pass"
arch=('x86_64')
url='https://github.com/mnussbaum/pass-systemd-cred-server'
license=('GPL-3.0-only')
depends=('pass')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('778e4267e11706e0af23c5a5f5a7558e0b093756903292f74ff94358523b3af77ca18b554e09d769d3187784691485c950f275d736d9cd08306a3ef1a1e57cee')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" \
        contrib/pass-credential-server.socket \
        contrib/pass-credential-server.service
}
