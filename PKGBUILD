# Maintainer: luytan <luytan@khora.me>
# Please someone maintain this and make a better one, i do not use Arch!!!btw

pkgbase=cardwire
pkgname=cardwire
pkgver=0.8.0
pkgrel=1
pkgdesc='GPU manager for Linux using eBPF LSM hooks'
arch=('x86_64')
url='https://github.com/OpenGamingCollective/cardwire'
license=('GPL3')
depends=('hwdata' 'dbus' 'systemd' 'upower')
makedepends=('libbpf' 'rust' 'clang')
source=("https://github.com/OpenGamingCollective/cardwire/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0b03e1baee1a7fdea0a1028c03d984dee6d9863cb51c2a72b32f9fc288cd1d51')

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
	install -Dm644 assets/cardwired.service "$pkgdir/usr/lib/systemd/system/cardwired.service"
	install -Dm644 assets/com.github.opengamingcollective.cardwire.conf "$pkgdir/usr/share/dbus-1/system.d/com.github.opengamingcollective.cardwire.conf"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
