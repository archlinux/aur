_pkgname='river'
pkgname="${_pkgname}-git"
pkgver=r147.109a744
pkgrel=1
pkgdesc='A dyanmic wayland compositor.'
arch=('any')
url="https://github.com/ifreund/${_pkgname}"
license=('MIT')
depends=('zig' 'wlroots')
makedepends=('git' 'wayland-protocols')
provides=('river')
conflicts=('river')
source=("${_pkgname}-${pkgver}::git+${url}.git")
md5sums=(SKIP)

pkgver() {
	cd "${_pkgname}-${pkgver}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}-${pkgver}"
	zig build -Drelease-safe
}

check() {
	cd "${_pkgname}-${pkgver}"
	zig build test -Drelease-safe
}

package() {
	cd "${_pkgname}-${pkgver}"
	zig build install -Drelease-safe --prefix .
	install -Dm 755 bin/river -t "${pkgdir}/usr/bin/"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
