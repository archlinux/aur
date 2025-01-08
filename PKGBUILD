# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Philipp Micheel <bbx0+borgreport at bitdevs dot de>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=borgreport
pkgver=0.3.0
pkgrel=2
pkgdesc="Summarize the status of multiple BorgBackup repositories in one report"
arch=('x86_64' 'aarch64')
url="https://github.com/bbx0/${pkgname}"
license=('GPL-3.0-or-later')
makedepends=('cargo' 'cargo-about' 'grep' 'groff' 'help2man' 'sed')
optdepends=('smtp-forwarder: send the report via sendmail')
install=borgreport.install
source=("${pkgname}-${pkgver}.tar.gz::${url}//releases/download/v${pkgver}/borgreport-${pkgver}.tar.gz")
b2sums=('30304b00a36ebfbc7ea227bbe6a5f85c292ed028faaa7115bb33e485bdec58c65baf646f0b0ab8c81c9aa821ef778f086c260e4ee760c1ff3600af602c865cc3')

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
