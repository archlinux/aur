# Maintainer: Mike Macpherson <mmacpherson@users.noreply.github.com>
pkgname=s1500d
pkgver=0.3.0
pkgrel=1
pkgdesc='Bespoke event daemon for the Fujitsu ScanSnap S1500'
url='https://github.com/mmacpherson/s1500d'
license=('MIT' 'Apache-2.0')
arch=('x86_64')
makedepends=('cargo' 'libusb')
depends=('libusb')
install=s1500d.install
backup=('etc/s1500d/config.toml')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('af6cd27693f360ee3998f9b1b1c9862914c370cb4ec084f3ad7da955349f44a8')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 target/release/s1500d "$pkgdir/usr/bin/s1500d"
    install -Dm0644 contrib/s1500d.service "$pkgdir/usr/lib/systemd/system/s1500d.service"
    install -Dm0644 contrib/99-scansnap.rules "$pkgdir/usr/lib/udev/rules.d/99-scansnap.rules"
    install -Dm0644 contrib/config.toml "$pkgdir/etc/s1500d/config.toml"
    install -Dm0755 contrib/handler-example.sh "$pkgdir/usr/share/s1500d/handler-example.sh"
    install -Dm0755 contrib/handler-scan-to-pdf.sh "$pkgdir/usr/share/s1500d/handler-scan-to-pdf.sh"
    install -Dm0644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm0644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
