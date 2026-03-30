# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=okapi
pkgver=0.4.0
pkgrel=1
pkgdesc="Find lines across files by regex and edit them all at once with your $EDITOR"
arch=('x86_64')
url="https://github.com/nk9/$pkgname"
license=('MIT')
makedepends=('cargo' 'git')
depends=('ripgrep')
source=(git+${url}.git#tag=v${pkgver})
sha256sums=('28ca465ec73c8fc4d4aa8eb13089cdb56447444ef3b7ecca4df9b4bd887ee7e1')

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	# since it is MIT we need to install a license file
	install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
	# install documentation
	install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
}
