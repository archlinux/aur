# Maintainer: luytan <luytan@khora.me>

pkgbase=cardwire
pkgname=cardwire
pkgver=0.12.0
pkgrel=1
pkgdesc='GPU manager for Linux using eBPF LSM hooks'
arch=('x86_64')
url='https://github.com/OpenGamingCollective/cardwire'
license=('GPL3')
depends=('hwdata' 'dbus' 'systemd' 'upower')
makedepends=('cargo' 'bpf-linker' 'rustup')
source=("https://github.com/OpenGamingCollective/cardwire/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5f2da91d4d62cee8c2ca962cbdc4cad69399bdb36e9cc7fadaa351533c2b1820')

prepare(){
	cd "${pkgbase}-${pkgver}"
	rustup toolchain install nightly-2026-08-04 --component rust-src
	cargo fetch --locked
}
options=('!lto')
build(){
	cd "${pkgbase}-${pkgver}"
	export CARGO_TARGET_DIR=target
	export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/usr/src"

	cargo build --frozen --release --bins
}

package(){
	cd "${pkgbase}-${pkgver}"
	install -Dm755 target/release/cardwire "$pkgdir/usr/bin/cardwire"
	install -Dm755 target/release/cardwired "$pkgdir/usr/bin/cardwired"
	install -Dm755 target/release/cardwire-gui "$pkgdir/usr/bin/cardwire-gui"
	install -Dm644 assets/cardwired.service "$pkgdir/usr/lib/systemd/system/cardwired.service"
	install -Dm644 assets/org.opengamingcollective.cardwire.conf "$pkgdir/usr/share/dbus-1/system.d/org.opengamingcollective.cardwire.conf"
	install -Dm644 assets/cardwire-gui.desktop "$pkgdir/usr/share/applications/cardwire-gui.desktop"
	install -Dm644 assets/org.opengamingcollective.cardwire.metainfo.xml "$pkgdir/usr/share/metainfo/org.opengamingcollective.cardwire.metainfo.xml"
	for icon in assets/icons/*.svg; do
		install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$(basename "$icon")"
	done
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}