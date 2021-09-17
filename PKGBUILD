# Maintainer: michaelkuc6 <michaelkuc6 at gmail dot com>
_pkgname=catfs
pkgname="${_pkgname}-git"
pkgver=0.8.0.r38.gcbd7ab7
pkgrel=1
pkgdesc="Cache AnyThing filesystem written in Rust"
arch=('x86_64')
url="https://github.com/kahing/catfs"
license=('Apache')
depends=()
makedepends=('cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/kahing/catfs.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${srcdir}/${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "${srcdir}/${_pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
}
