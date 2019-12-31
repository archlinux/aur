# Maintainer: Paul Seehofer <seehofer.paul@gmail.com>
pkgname=prometheus_wireguard_exporter
pkgver=3.2.2
pkgrel=1
pkgdesc="A prometheus exporter for wireguard stats"
url="https://github.com/MindFlavor/prometheus_wireguard_exporter/"
makedepends=('rustup')
arch=('i686' 'x86_64')
license=('MIT')
source=('prometheus-wireguard-exporter.service'
	"$pkgname-$pkgver.tar.gz::https://github.com/MindFlavor/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f793e2cf5016dd571c04fe1bccd561ef433e8559749fa43added732df27529fb4801de26a8b3869de78a018ee8d3adfccc7cf245d79841a834704a1357bc6376'
	'd5ee1e415f1774c8a4909695160b1c818053966770295162c2a8cf5e3612a22ee615c9c4f0a4690fa1af8c853c58cfe5aa51c97bbc112b6e1bccc35e37fe3d33')

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
