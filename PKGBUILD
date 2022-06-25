# Maintainer: Norbert Preining <norbert@preining.info>
pkgname=hdr10plus_tool
pkgver=1.3.1
pkgrel=1
pkgdesc="CLI utility to work with HDR10+ in HEVC files."
arch=('x86_64')
url="https://github.com/quietvoid/$pkgname"
license=('MIT')
makedepends=('cargo' 'git')
depends=('gcc-libs')
source=(git+${url}.git#tag=${pkgver})
sha256sums=('SKIP')

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
