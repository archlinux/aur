# Maintainer: Philipp Micheel <bbx0+aur at bitdevs dot de>
# Contributor: Trevor Bentley <trevor at trevorbentley dot com>

# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=circadian
pkgver=0.8.4
pkgrel=2
pkgdesc="Linux auto-suspend/wake power management daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/mrmekon/${pkgname}"
license=('GPL3')
depends=('awk' 'coreutils' 'gcc-libs' 'grep' 'sed' 'sh')
makedepends=('cargo')
optdepends=(
	'xssstate: for monitoring x11 input'
	'xprintidle: for monitoring x11 input'
	'procps: for monitoring tty input, uptime or processes'
	'net-tools: for monitoring nfs, smb or ssh'
	'libpulse: audio detection support via pactl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('055b7b4da7ffdd8321e3d51a6c55b9e0d26494e2aeea7d40d401c8e0a02705a8982120568b115dd930410fbe561a38c060d6e975b1af88b82eb7c3caf278fe9c')
backup=('etc/circadian.conf')

prepare() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse

	# Bump time-rs version to allow compilation with Rust 1.80.
	# ref: https://github.com/mrmekon/circadian/pull/29
	cargo update time@0.3.20 --precise 0.3.36

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export CARGO_INCREMENTAL=0

	cargo build --frozen --release --all-features
}

check() {
	cd "${pkgname}-${pkgver}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_INCREMENTAL=0

	cargo test --frozen --all-features
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
	install -Dm0644 -T "resources/circadian.conf.in" "${pkgdir}/etc/circadian.conf"
	install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system/" "resources/circadian.service"
	install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
}
