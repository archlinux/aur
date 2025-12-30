# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: tee < teeaur at duck dot com >
# Contributor: Jean Lucas <jean@4ray.co>

_pkgname=bb

pkgname=${_pkgname}-rs
pkgver=0.4.4
pkgrel=1
pkgdesc='Simple process viewer in Rust'

arch=('x86_64' 'aarch64')
url='https://nessuent.xyz/bb.html'
license=('GPL-3.0')

provides=("${_pkgname}")

makedepends=('rust')
depends=('glibc' 'gcc-libs')

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/epilys/${_pkgname}/archive/v${pkgver}.tar.gz)
b2sums=('cc40490abef8badbfa613ae009f6fb1e44ddd6058baf72a4676271fe26665573f670a7ae9e617c0d2ea9b81c1dacb70bf65e97aadfeb9dc6f6f6cd522badda95')

prepare() {
	cd "${_pkgname}-${pkgver}/"

	if [[ ${CARCH} = aarch64 ]]; then
		# Fixes build on AArch64
		sed 's#i8#u8#g' -i "src/ui.rs"
	else
		# Fixes build in chroot on x86_64
		true
	fi

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${_pkgname}-${pkgver}/"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	cargo build --frozen --release --all-features
}

check() {
	cd "${_pkgname}-${pkgver}/"

	cargo test --release
}

package() {
	cd "${_pkgname}-${pkgver}/"

	install -Dm 755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin/"

	install -Dm 644 "${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"

	install -Dm 644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm 644 "COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
