# Maintainer: SelfRef <arch@selfref.dev>

_basename=mrpack-install
pkgname="${_basename}-git"
pkgver=r369.82610e1
pkgrel=1
pkgdesc="Modrinth Modpack server deployment"
arch=('any')
url="https://github.com/nothub/mrpack-install"
license=('MIT')
provides=('mrpack-install')
conflicts=('mrpack-install')
makedepends=('git' 'go' 'goreleaser')
source=("${_basename}"::"git+https://github.com/nothub/mrpack-install.git")
md5sums=('SKIP')

pkgver() {
	cd "$_basename"
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "$_basename"
	goreleaser build --clean --snapshot --single-target --output mrpack-install
}

package() {
	install -Dm755 -t "${pkgdir}/usr/bin" "${_basename}/mrpack-install"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${_basename}" "${_basename}/LICENSE.txt"
}
