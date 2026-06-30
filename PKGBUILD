# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>
# Contributor: jakka <jakka@jakka.su>

pkgname=pass-secret-service
pkgver=0.7.1
pkgrel=1
pkgdesc="An org.freedesktop.secrets provider with a pass backend"
arch=('x86_64' 'aarch64')
url="https://github.com/grimsteel/pass-secret-service"
license=('GPL-3.0-only')
depends=('dbus' 'gcc-libs' 'glibc' 'pass')
makedepends=('cargo')
provides=('org.freedesktop.secrets')
conflicts=('pass-secret-service-bin' 'pass-secret-service-git' 'gnome-keyring')

_tag=v${pkgver}

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_tag}.tar.gz")
b2sums=('2a50e512ac20f1e13566d1f92e88946c5078f55f5e3df868a4c28c7d4888b3dab11d05f63556495fb7540a2f1b224702027c49ff30bc23a761f808c5746de713')

prepare() {
	cd "${pkgname}-${pkgver}"

	cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
	cd "${pkgname}-${pkgver}"

	cargo build --frozen --release --target-dir target
}

check() {
	cd "${pkgname}-${pkgver}"

	cargo test --frozen --release --target-dir target
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 target/release/pass-secret-service \
		"${pkgdir}/usr/bin/pass-secret-service"

	install -Dm644 systemd/org.freedesktop.secrets.service \
		"${pkgdir}/usr/share/dbus-1/services/org.freedesktop.secrets.service"

	install -Dm644 systemd/pass-secret-service.service \
		"${pkgdir}/usr/lib/systemd/user/pass-secret-service.service"

	install -Dm644 README.md \
		"${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
