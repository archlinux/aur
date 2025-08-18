# Maintainer: Rafael Silva <perigoso@riseup.net>

_pkgname='bmpflash'
pkgname="${_pkgname}-git"
pkgver=r268.ea1fa34
pkgrel=1
pkgdesc='A command line utility for setting up the on-board Flash of BMP v2.3+ hardware for use in standalone mode'
arch=('any')
url="https://github.com/blackmagic-debug/${_pkgname}"
license=('BSD-3-Clause')
depends=('libusb')
makedepends=('git' 'meson')
source=("git+https://github.com/blackmagic-debug/${_pkgname}.git")
b2sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	meson subprojects download --sourcedir="${_pkgname}"
}

build() {
	arch-meson "${_pkgname}" build
	meson compile -C build
}

package() {
	# Not currently supported by upstream
	# meson install -C build --destdir "${pkgdir}"
	install -Dm755 "build/src/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
