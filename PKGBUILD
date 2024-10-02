# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Philipp Micheel <bbx0+borgreport at bitdevs dot de>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=borgreport
pkgver=0.1.0
pkgrel=1
pkgdesc="Summarize the status of multiple BorgBackup repositories in one report"
arch=('x86_64' 'aarch64')
url="https://github.com/bbx0/${pkgname}"
license=('GPL-3.0-or-later')
makedepends=('cargo' 'cargo-about' 'grep' 'groff' 'help2man' 'sed')
install=borgreport.install
source=("${pkgname}-${pkgver}.tar.gz::${url}//releases/download/v${pkgver}/borgreport-${pkgver}.tar.gz")
b2sums=('30ea3b913ee1f40aa62fc8172fb0010b038c42b7ea464fe7886a048009b6fac0678829dc70a5b7d1a0a0fa3f14a0c29e931b2db1bbda04c7e39a024d3bb349dc')

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
