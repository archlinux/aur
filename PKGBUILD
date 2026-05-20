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
b2sums=('caa58a2e7087a49c56d1cb221e68c34729a00b9e90efe00c08ba41a77307a8ac74c1eaadfc91f1761e613b85ff86ddced37718ee081528a6fef7e5d4b2e6ceed')

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
