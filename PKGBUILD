# Maintainer: luytan <luytan@khora.me>

pkgbase=cardwire
pkgname=cardwire
pkgver=0.11.1
pkgrel=1
pkgdesc='GPU manager for Linux using eBPF LSM hooks'
arch=('x86_64')
url='https://github.com/OpenGamingCollective/cardwire'
license=('GPL3')
depends=('hwdata' 'dbus' 'systemd' 'upower')
makedepends=('libbpf' 'rust' 'clang')
source=("https://github.com/OpenGamingCollective/cardwire/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46177bfa427bcb277c29718ee0eb421dcdb31dba33697019741ad56c4c1d7ba8')

prepare(){
	cd "${pkgbase}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked
}

build(){
	cd "${pkgbase}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir=/usr/src"

	cargo build --frozen --release --workspace --bins
}

package(){
	cd "${pkgbase}-${pkgver}"
	install -Dm755 target/release/cardwire "$pkgdir/usr/bin/cardwire"
	install -Dm755 target/release/cardwired "$pkgdir/usr/bin/cardwired"
	install -Dm755 target/release/cardwire-gui "$pkgdir/usr/bin/cardwire-gui"
	install -Dm644 assets/cardwired.service "$pkgdir/usr/lib/systemd/system/cardwired.service"
	install -Dm644 assets/com.github.opengamingcollective.cardwire.conf "$pkgdir/usr/share/dbus-1/system.d/com.github.opengamingcollective.cardwire.conf"
	install -Dm644 assets/cardwire-gui.desktop "$pkgdir/usr/share/applications/cardwire-gui.desktop"
	for icon in assets/icons/*.svg; do
		install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$(basename "$icon")"
	done
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
