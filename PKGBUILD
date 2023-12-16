# Maintainer: Thomas Böhler <witcher@wiredspace.de>

pkgname="rss-email"
pkgver=v0.4.5
pkgrel=0
pkgdesc="Send new RSS/Atom posts as email"
arch=('x86_64')
url="https://sr.ht/~witcher/$pkgname"
license=('WTFPL')
conflicts=('rss-email-git')
depends=('sqlite')
makedepends=('cargo' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~witcher/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('206067a62ee0fce2feae4f04bfb9859be52bccdb5b67f47e4b21338177f4d0b8')

prepare() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR="target"
	cargo build --frozen --release --all-features

	scdoc < "docs/${pkgname}.1.scd" | gzip > "docs/${pkgname}.1.gz"
	scdoc < "docs/${pkgname}.5.scd" | gzip > "docs/${pkgname}.5.gz"
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
	install -Dm644 -t "${pkgdir}/usr/share/man/man1" "docs/${pkgname}.1.gz"
	install -Dm644 -t "${pkgdir}/usr/share/man/man5" "docs/${pkgname}.5.gz"
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "README.md" "config.example.toml"
}
