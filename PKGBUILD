# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Ashton Bennet <ashtonquinn@disroot.org>

pkgname=humnumsort
pkgver=0.1.1
pkgrel=2
pkgdesc='A more human-friendly alternative to GNU Sort, written in Rust'
provides=('humnumsort')
makedepends=('cargo')
arch=('x86_64' 'armv6h' 'armv7h')
license=('Apache-2.0')
url='https://github.com/ctrlcctrlv/humnumsort'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fa4490ac64035fac0c9f60f2af3413a548e20aebe1e53214d5084587ea2e11e2')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/bin"
	# Upstream lockfile is buggered in v0.1.1
	cargo update
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/bin"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}/bin"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/bin"
	install -Dm755 target/release/hns ${pkgdir}/usr/bin/hns
	ln -s /usr/bin/hns ${pkgdir}/usr/bin/hns+
  install -Dm644 ../README.md "${pkgdir}"/usr/share/doc/"${_pkgname}"/README.md
}

