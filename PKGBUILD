# Maintainer: nathawat <nathawat[at]noreply[dot]codeberg[dot]org>
# Contributor: jakka <jakka@jakka.su>

pkgname=pass-secret-service
pkgver=0.7.0
pkgrel=2
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
b2sums=('e9c5aae7fcfc348d092cb25f98821aac98fe17e746f89e5f0e93412409d887c6bbbc0076badd6e9e11858bb68abeba97a00cf52f99597e2bbd02e804d01ad9b8')

prepare() {
	cd "${pkgname}-${pkgver}"

	cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
	cd "${pkgname}-${pkgver}"

	cargo build --frozen --release --target-dir target
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
