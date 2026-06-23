# Maintainer: nathawat <nathawat at noreply dot codeberg dot org>

pkgname=hyprmt
pkgver=3.0.1
pkgrel=1
_tag=v${pkgver}
pkgdesc="Hyprland monitor toggle utility inspired by the Windows + P display picker"
arch=("x86_64")
url="https://codeberg.org/nathawat/hyprmt"
license=("GPL-3.0-or-later")
depends=("glibc" "hyprland>=0.55.0")
makedepends=("cargo")
optdepends=("fuzzel: overlay picker support")
provides=("hyprmt")
conflicts=("hyprmt-brightstay")
replaces=("hyprmt-brightstay")
install=hyprmt.install
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/nathawat/hyprmt/archive/${_tag}.tar.gz")
b2sums=('579f7f3556efafc7dd3bd0fa72406bbf0f4d6f9b3894067d6aa4d650b86a6ec6153eaeae3683f27116158f079a85a1e3948611a97e8858716b55d1a7b5b83bca')

prepare() {
	cd "${srcdir}/${pkgname}"
	cargo fetch --locked
}

build() {
	cd "${srcdir}/${pkgname}"
	cargo build --frozen --release
}

check() {
	cd "${srcdir}/${pkgname}"
	cargo test --frozen
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "arch/assets/sysusers.d/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.sysusers"
	install -Dm644 "arch/assets/udev/rules.d/45-${pkgname}.rules" "${pkgdir}/usr/lib/udev/rules.d/${pkgname}.rules"
	install -Dm644 "arch/assets/modules-load.d/${pkgname}.conf" "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
}
