# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=unmake-git
pkgver=0.0.3.r16.g7826475
pkgrel=1
pkgdesc="a makefile linter"
arch=('x86_64' 'aarch64')
url="https://github.com/mcandre/unmake"
license=('BSD')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	cargo update  # upstream doesn't provide Cargo.lock file
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname%-git}"
	cargo build --release --frozen
}

check() {
	cd "${pkgname%-git}"
	cargo test --release --frozen
}

package() {
	cd "${pkgname%-git}"
	install -vDm755 -t "${pkgdir}/usr/bin" 'target/release/unmake'
	install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname%-git}" 'LICENSE.md'
	install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" 'README.md'
	install -vd "${pkgdir}/usr/share/doc/${pkgname%-git}"
	cp -vR -t "${pkgdir}/usr/share/doc/${pkgname%-git}" examples
}
