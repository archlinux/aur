# Maintainer: TTsdzb <ttsdzboutlook dot com>
# Maintainer: Jia Yin<lok-ation at outlook dot com>

pkgname=uni-updater
pkgver=0.2.2
pkgrel=1
pkgdesc='Helper program that updates everything on your system.'
arch=('x86_64')
url="https://codeberg.org/TTsdzb/uni-updater"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
conflicts=('uni-updater')
provides=("uni-updater=${pkgver}")
source=("$pkgname::git+$url#tag=$pkgver")
sha512sums=('549ddf732c5c343a8c18203574f1c60ad80e8e125248181b1101a9661cade75a83cc21ded14dd86239c3efac6fe7569e34b4cefb796243a443d92110f2facb99')
prepare() {
	cd "$pkgname"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --release --frozen --all-features
}

package() {
	cd "$pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" target/release/uni-updater
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
