# Maintainer: Paul Seehofer <seehofer.paul@gmail.com>
pkgname=prometheus_wireguard_exporter
pkgver=3.4.1
pkgrel=1
pkgdesc="A prometheus exporter for wireguard stats"
url="https://github.com/MindFlavor/prometheus_wireguard_exporter/"
depends=('wireguard-tools')
makedepends=('rustup')
arch=('i686' 'x86_64')
license=('MIT')
source=('prometheus-wireguard-exporter.service'
	"$pkgname-$pkgver.tar.gz::https://github.com/MindFlavor/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('6eab9d425f63ab73c53a321c012106fec14ce79074a760c53c2db138d75cd01069a5f18661ba20bc978f51803a597a12f0ffab13d32ca7eb9d0707549e85e909'
	'67f5d005dcca7aa6e0bcbdd014eb84275b74a2df5a5966d54f5f1b7f552dc7eec671f9c4d6b67d7b8e034fd323a09e5c427efee430bb79db3c427327d4952eeb')

build() {
	cd "$pkgname-$pkgver"
	rustup install nightly
	rustup run nightly \
		cargo build --release --locked --all-features
}

check() {
	cd "$pkgname-$pkgver"
	rustup run nightly \
		cargo test --release --locked --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	# Install SystemD Service File
	install -D -m0644 "${srcdir}/prometheus-wireguard-exporter.service" \
        "${pkgdir}/usr/lib/systemd/system/prometheus-wireguard-exporter.service"
}
