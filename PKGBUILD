# Maintainer: Alex Indigo <ai@aegis.one>

pkgname=1password-secret-service-beta-git
_projname=1password-secret-service
_release_ver=0.1.0.r0
pkgver=0.1.0.r2.g56a2fe0
pkgrel=2
pkgdesc="Freedesktop Secret Service (org.freedesktop.secrets) provider backed by 1Password (git version, for 1password-beta)"
arch=('x86_64' 'aarch64')
url="https://github.com/alexindigo/1password-secret-service"
license=('GPL-3.0-or-later')
depends=('1password-beta' 'glibc')
makedepends=('go' 'git')
provides=('1password-secret-service')
conflicts=('1password-secret-service' '1password-secret-service-beta' '1password-secret-service-git')
# Go's debug split produces broken build-id symlinks; disable it.
options=('!debug')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	local out
	out=$(git describe --long --tags 2>/dev/null) || out=""
	if [ -n "$out" ]; then
		printf "%s" "$out" | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
	else
		echo "${_release_ver}.g$(git rev-parse --short HEAD)"
	fi
}

build() {
	cd "${srcdir}/${pkgname}"
	export CGO_ENABLED=1
	local _ver
	_ver=$(pkgver)
	go build -trimpath -buildmode=pie \
		-ldflags="-s -w -linkmode=external -extldflags=-Wl,-z,relro,-z,now -X main.integrationVersion=v${_ver}" \
		-o "${_projname}" "./cmd/${_projname}"
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 "${_projname}" "${pkgdir}/usr/bin/${_projname}"
	install -Dm644 packaging/1password-secret-service.service \
		"${pkgdir}/usr/lib/systemd/user/1password-secret-service.service"
	install -Dm644 packaging/org.freedesktop.secrets.service \
		"${pkgdir}/usr/share/dbus-1/services/org.freedesktop.secrets.service"
	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${_projname}/LICENSE"
}
