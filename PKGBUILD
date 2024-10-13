# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Philipp Micheel <bbx0+borgreport at bitdevs dot de>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=borgreport
pkgver=0.2.0
pkgrel=1
pkgdesc="Summarize the status of multiple BorgBackup repositories in one report"
arch=('x86_64' 'aarch64')
url="https://github.com/bbx0/${pkgname}"
license=('GPL-3.0-or-later')
makedepends=('cargo' 'cargo-about' 'grep' 'groff' 'help2man' 'sed')
install=borgreport.install
source=("${pkgname}-${pkgver}.tar.gz::${url}//releases/download/v${pkgver}/borgreport-${pkgver}.tar.gz")
b2sums=('720c5d7f6a775c34715f34588ec0ae5dc26321a69c62a206e59eaeae8f04c193999feb97e25877defb50413d82d97c97b743318680ed64c6cea8936287e0d8ac')

prepare() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse

	make prepare
}

build() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CARGO_INCREMENTAL=0

	make build
	make assets
}

check() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_INCREMENTAL=0

	cargo test --frozen --all-features
}

package() {
	depends=('borg' 'glibc' 'gcc-libs')

	cd "${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} PREFIX=/usr install
	install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE-THIRD-PARTY.md"
}
