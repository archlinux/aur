# Maintainer: Scott <158021536+nathawatc@users.noreply.github.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=hyprmt
pkgver=3.0.2
pkgrel=2
_tag=v${pkgver}
pkgdesc="Hyprland monitor toggle utility inspired by the Windows + P display picker"
arch=("x86_64")
url="https://github.com/nathawatc/hyprmt"
license=("GPL-3.0-or-later")
depends=("glibc" "hyprland>=0.55.0")
makedepends=("cargo")
optdepends=("fuzzel: overlay picker support")
install=hyprmt.install
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${_tag}.tar.gz")
b2sums=('4a8c5404d9ad4973f79f62f6c6b51503651f2d4e3dc3b267e34b13a7d6c94b61ddc3d14d2d8ca59cbc6dad8a3ede88b2620e3d7c5eb13c8d958ce0b99b5e2a6f')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo fetch --locked
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --frozen --release
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo test --frozen
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "arch/assets/sysusers.d/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.sysusers"
	install -Dm644 "arch/assets/udev/rules.d/45-${pkgname}.rules" "${pkgdir}/usr/lib/udev/rules.d/${pkgname}.rules"
	install -Dm644 "arch/assets/modules-load.d/${pkgname}.conf" "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
}
