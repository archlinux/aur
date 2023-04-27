# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=wthrr-git
pkgver=1.0.2.r0.g43a0e36
pkgrel=1
pkgdesc="Weather companion for the terminal (git)"
arch=('x86_64')
url="https://github.com/tobealive/wthrr-the-weathercrab"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo' 'git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mv "wthrr-the-weathercrab" "${pkgname%-git}"
	cd "${pkgname%-git}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname%-git}"
	cargo build --release --frozen
}

check() {
	cd "${pkgname%-git}"
	cargo test --frozen
}

package() {
	cd "${pkgname%-git}"
	install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
