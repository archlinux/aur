# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='runes-git'
pkgver=r447.df7ea0e
pkgrel=1
pkgdesc='A modern terminal client'
arch=('x86_64')
depends=('pango' 'libevent')
license=('MIT')
url='https://github.com/doy/runes'
source=("${pkgname}::git+${url}" "libvt100::git://github.com/doy/libvt100")
sha512sums=('SKIP' 'SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare () {
	cd "${pkgname}"
	git submodule init
	git config submodule.libvt100.url "${srcdir}/libvt100"
	git submodule update
}

build () {
	cd "${pkgname}"
	make release
}

package () {
	cd "${pkgname}"
	for file in runesc runesd runes ; do
		install -Dm755 "${file}" "${pkgdir}/usr/bin/${file}"
	done
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 runes.conf.default "${pkgdir}/etc/runesrc"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
