# Maintainer: Alex Indigo <ai@aegis.one>

pkgname=1password-secret-service-beta
_projname=1password-secret-service
pkgver=0.1.0
pkgrel=2
pkgdesc="Freedesktop Secret Service (org.freedesktop.secrets) provider backed by 1Password (for 1password-beta users)"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/1password-secret-service"
license=('GPL-3.0-or-later')
depends=('1password-beta' 'sqlite' 'glibc')
makedepends=('go')
provides=('1password-secret-service')
conflicts=('1password-secret-service' '1password-secret-service-beta-git')
# Go's debug split produces broken build-id symlinks; disable it.
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0bbc70cf06f42f323528d65fd6bde1262a0c3bde069052caaa0eaff736d59f64')

build() {
	cd "${srcdir}/${_projname}-${pkgver}"
	export CGO_ENABLED=1
	go build -trimpath -buildmode=pie -ldflags="-s -w" \
		-o "${_projname}" "./cmd/${_projname}"
}

package() {
	cd "${srcdir}/${_projname}-${pkgver}"
	install -Dm755 "${_projname}" "${pkgdir}/usr/bin/${_projname}"
	install -Dm644 packaging/1password-secret-service.service \
		"${pkgdir}/usr/lib/systemd/user/1password-secret-service.service"
	install -Dm644 packaging/org.freedesktop.secrets.service \
		"${pkgdir}/usr/share/dbus-1/services/org.freedesktop.secrets.service"
	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${_projname}/LICENSE"
}
