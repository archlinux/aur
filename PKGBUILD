# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>

pkgname=iweap
pkgver=1.0.0
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
b2sums=('bdaec77b1f81d2316036bd543440c98cffdad410f842cbc19ee12247dbb077b3ad61053445b5fc8d0bf6ba3e07a530e29af138cf35f83ee9e99a66346d697782')

prepare() {
	cd "${pkgname}"

	cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
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
