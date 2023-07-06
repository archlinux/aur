# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=unmake-git
_pkgname="${pkgname%-git}"
pkgver=0.0.12.r2.g1763434
pkgrel=1
pkgdesc="a makefile linter"
arch=('x86_64' 'aarch64')
url="https://github.com/mcandre/unmake"
license=('BSD')
makedepends=('git' 'cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_pkgname}"
	cargo update  # upstream doesn't provide Cargo.lock file
	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${_pkgname}"
	cargo build --release --frozen
}

check() {
	cd "${_pkgname}"
	cargo test --release --frozen
}

package() {
	cd "${_pkgname}"
	install -vDm755 -t "${pkgdir}/usr/bin" 'target/release/unmake'
	install -vDm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" 'LICENSE.md'
	install -vDm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md' 'SYNTAX.md' 'WARNINGS.md'
	install -vdm755 "${pkgdir}/usr/share/doc/${_pkgname}/examples"
	cp -vR -t "${pkgdir}/usr/share/doc/${_pkgname}/examples" fixtures/*
}
