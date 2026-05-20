# Maintainer: mnussbaum <michaelnussbaum08@gmail.com>
pkgname=pass-systemd-cred-server
pkgver=0.2.0
pkgrel=1
pkgdesc="systemd credential server backed by zx2c4's pass"
arch=('x86_64')
url='https://github.com/mnussbaum/pass-systemd-cred-server'
license=('GPL-3.0-only')
depends=('pass')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('f97cf156cf7d5ccc5281939c0aa1969df6a76732b1afc5e68fff6b2cc6ac996532c7a1346742eab358360ff5a764848fee029820b5a921935ae2bea1e2c7d768')

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
        contrib/pass-credential@.socket \
        contrib/pass-credential@.service
}
