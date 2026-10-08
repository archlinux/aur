# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=iweap
pkgver=1.0.1
pkgrel=1
pkgdesc="Secure interactive IWD 802.1X profile generator"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/nathawat/iweap"
license=('GPL-3.0-or-later')
depends=(
	'dbus'
	'glibc'
	'iwd'
	'libgcc'
	'polkit'
	'systemd'
)
makedepends=('cargo')

_tag=v${pkgver}

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
b2sums=('54ed9e0c836ef7b27e1a49f73ceda597ecbee390f5846272896f76a94ae5df3be7fccda25a0ef56172128d2b5434ff20453058cb469582886c858118a792e15b')

prepare() {
	cd "${pkgname}"

	cargo fetch --locked
}

build() {
	cd "${pkgname}"

	cargo build --frozen --release --target-dir target
}

check() {
	cd "${pkgname}"

	cargo test --frozen --release --target-dir target
}

package() {
	cd "${pkgname}"

	install -Dm755 target/release/iweap \
		"${pkgdir}/usr/bin/iweap"

	install -Dm755 target/release/iweap-service \
		"${pkgdir}/usr/lib/iweap/iweap-service"

	install -Dm644 data/dbus/org.codeberg.iweap.conf \
		"${pkgdir}/usr/share/dbus-1/system.d/org.codeberg.iweap.conf"

	install -Dm644 data/dbus/org.codeberg.iweap.service \
		"${pkgdir}/usr/share/dbus-1/system-services/org.codeberg.iweap.service"

	install -Dm644 data/org.codeberg.iweap.policy \
		"${pkgdir}/usr/share/polkit-1/actions/org.codeberg.iweap.policy"

	install -Dm644 data/systemd/org.codeberg.iweap.service \
		"${pkgdir}/usr/lib/systemd/system/org.codeberg.iweap.service"

	install -Dm644 README.md \
		"${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
