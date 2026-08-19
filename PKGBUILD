# Maintainer: luytan <luytan@khora.me>

pkgbase=cardwire
pkgname=cardwire
pkgver=0.12.1
pkgrel=1
pkgdesc='GPU manager for Linux using eBPF LSM hooks'
arch=('x86_64')
url='https://github.com/OpenGamingCollective/cardwire'
license=('GPL3')
depends=('hwdata' 'dbus' 'sqlite' 'systemd' 'upower')
makedepends=('rust' 'rust-src' 'cargo-binstall' 'libxcb')
source=("https://github.com/OpenGamingCollective/cardwire/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eba92c952f002767abead1391d9d2d229e3637a756ac4786759a0012b7e96649')

prepare(){
	cd "${pkgbase}-${pkgver}"
	cargo fetch --locked
	# This is a workaround to get cardwire-ebpf building
	# bpf-linker linked to llvm 22 or built with llvm 22 cannot compile the crate
	# the official binstall ship a llvm 23 static linked bpf-linker, this is what is used
	cargo binstall --locked --no-confirm \
		--root "${srcdir}/cardwire-tools"\
	       --version 0.11.0 bpf-linker
}

build(){
	cd "${pkgbase}-${pkgver}"
	export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
	export RUSTC_BOOTSTRAP=1
	export CARGO_TARGET_DIR=target
	export RUST_TOOLCHAIN=stable
	export PATH="${srcdir}/cardwire-tools/bin:$PATH"
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