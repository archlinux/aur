# Maintainer: Eli Skeggs <dev@eliskeggs.com>
pkgname=encrypt-remote-hook
pkgver=0.1.2
pkgrel=1
pkgdesc="An initcpio hook to decrypt roofs by combining keys from multiple endpoints."
arch=('x86_64')
url="https://github.com/skeggse/encrypt-remote-hook"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('acecad3c511e27effe7d6ee3f5cc7b435ef0ccd72a3abc20798560273a35d1be')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	# TODO: include /etc sample file
	cd "$pkgname-$pkgver"

	install -Dm0755 "${pkgname}-wrapper" "${pkgdir}/usr/lib/initcpio/hooks/encrypt-remote"
	install -Dm0755 "target/release/${pkgname}" "${pkgdir}/usr/lib/initcpio/hooks/${pkgname}-main"
	install -Dm0755 "${pkgname}-install" "${pkgdir}/usr/lib/initcpio/install/encrypt-remote"

	install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" "LICENSE"
}
