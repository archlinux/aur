# Maintainer: luytan <luytan@khora.me>
# Please someone maintain this and make a better one, i do not use Arch!!!btw

pkgbase=cardwire
pkgname=cardwire
pkgver=0.5.0
pkgrel=1
pkgdesc='GPU manager for Linux using eBPF LSM hooks'
arch=('x86_64')
url='https://github.com/OpenGamingCollective/cardwire'
license=('GPL3')
depends=('hwdata' 'dbus' 'systemd')
makedepends=('libbpf' 'rust' 'clang')
source=("https://github.com/OpenGamingCollective/cardwire/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a03a37414037a210d25426675604009a0031a8b5df63681135514c240fd6e4ca')

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
