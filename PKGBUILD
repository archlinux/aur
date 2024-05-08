# Maintainer: éclairevoyant
# Contributor: Will Elliott <troutcobbler at gmail dot com>

pkgname=eww
pkgver=0.6.0
pkgrel=1
pkgdesc="Standalone widget system made in Rust"
url='https://github.com/elkowar/eww'
arch=(x86_64)
license=(MIT)
makedepends=(cargo git)
depends=(libdbusmenu-gtk3 gtk3 gtk-layer-shell)
provides=(eww)
conflicts=(eww)
install=$pkgname.install
source=("git+$url?signed#commit=d87c2fdbfdc012e76d229e4e9ea3325bc0f23e89")
b2sums=('87aed3824d8549bf031a288c116bab16767d130e6939a8c12d03370dda4945260cf88185ce4680ac4b742f67e609bd429642995a6a91c967258022f8c50e7362')
validpgpkeys=(
	'9EFD181455D31DD0F42DA932862BA3D7D7760F13' # Leon Kowarschick <5300871+elkowar@users.noreply.github.com>
	'968479A1AFF927E37D1A566BB5690EEEBB952194' # GitHub (web-flow commit signing) <noreply@github.com>
)

prepare() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd $pkgname
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd $pkgname
	install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -vd "$pkgdir/etc/xdg/$pkgname/"
	cp -vr examples/eww-bar "$pkgdir/etc/xdg/$pkgname/"
	install -vDm755 target/release/$pkgname -t "$pkgdir/usr/bin/"
}
