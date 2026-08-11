# Maintainer: nathawat <nathawat at noreply dot codeberg dot org>

pkgname=hyprmt
pkgver=3.0.2
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
b2sums=('3f5c2a31d6c13c4ceb3106dce6b7bed1669704344aebef9bac1307b63d9374e1a979a9f553ecee2ecbacfe42a38ed840aa1e7c334f5e836085ce6fc2586017cf')

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
