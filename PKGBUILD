# Maintainer: Alex Indigo <ai@aegis.one>

pkgname=1password-secret-service
_projname=1password-secret-service
pkgver=0.2.1
pkgrel=1
pkgdesc="Freedesktop Secret Service (org.freedesktop.secrets) provider backed by 1Password"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/1password-secret-service"
license=('GPL-3.0-or-later')
depends=('1password' 'glibc')
makedepends=('go')
conflicts=('1password-secret-service-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('504b3ff8a19cb43c180e0d50a471fc49770d924a42061f0b466517ab22055ed9')

build() {
	cd "${srcdir}/${_projname}-${pkgver}"
	export CGO_ENABLED=1
	go build -trimpath -buildmode=pie \
		-ldflags="-s -w -X main.integrationVersion=v${pkgver}" \
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
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
