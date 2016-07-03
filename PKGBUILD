# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='gamut-git'
pkgdesc='Toolkit of (hopefully) suckless filters for the farbfeld image format'
pkgver=r20.f446d83
pkgrel=1
license=('Custom')
depends=('glibc')
arch=('i686' 'x86_64')
url='https://github.com/erik/gamut'
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver () {
	cd "${pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build () {
	cd "${pkgname}"
	make
}

package () {
	cd "${pkgname}"
	for file in flip convolute invert opacity ; do
		install -Dm755 "${file}" "${pkgdir}/usr/bin/${file}"
	done
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
