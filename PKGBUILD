# Maintainer: Scott <158021536+nathawatc@users.noreply.github.com>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=iweap
pkgver=1.0.1
pkgrel=2
pkgdesc="Secure interactive IWD 802.1X profile generator"
arch=('x86_64' 'aarch64')
url="https://github.com/nathawatc/iweap"
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
b2sums=('b82605a61508cf674718378227dbbb7e441c43048268dae43e88d333f7e7530e1f73acaf532b0a76d9fb834b34531e6fdb8017cdfdd0b7d6c3f1b28e7686d00e')

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
