# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=edit
pkgver=1.0.0
pkgrel=2
pkgdesc='A simple editor for simple needs (Microsoft Edit)'
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/microsoft/edit'
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo-nightly')
conflicts=('vi')
source=("${pkgname}::git+https://github.com/microsoft/edit.git#tag=v${pkgver}")
b2sums=('a965f610cf46ef9282512920e5c016810cf939f7083200f301802453815d2ca13099cbd169e82ea2c8c39012cad709872f24ffe7f0e3c3b18a71ded3a2461213')

prepare() {
	cd "${pkgname}"
	export RUSTUP_TOOLCHAIN=nightly
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${pkgname}"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

check() {
	cd "${pkgname}"
	export RUSTUP_TOOLCHAIN=nightly
	cargo test --frozen
}

package() {
	cd "${pkgname}"
	install -Dm755 "target/release/edit" "${pkgdir}/usr/bin/edit"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
