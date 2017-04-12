# Maintainer: Teteros <teteros -at- openmailbox -dot- org>

_pkgname=protrekkr
pkgname=protrekkr-git
pkgver=r687.dca6ef0
pkgrel=1
pkgdesc="Tracker program to for small sized intros, demos or games. (PaulBatchelor's fork)"
arch=(i686 x86_64)
url="http://pbat.ch/proj/protrekkr/"
license=(BSD)
depends=(
	liblo
	jack
	lua
	sdl
)
makedepends=(
	git
	sporth-git
	soundpipe-git
	runt-git
)
provides=(protrekkr)
conflicts=(protrekkr)
source=("git://github.com/PaulBatchelor/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Replace hardcoded /usr/local prefixes
	find "${_pkgname}" -type f -execdir sed -i "s|/usr/local|/usr|g" {} \;
}

build() {
	cd "${_pkgname}"
	make
}

package() {
	cd "${_pkgname}"
	mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/${_pkgname}"

	# Copy over folders in bin
	cp --recursive --reflink=auto bin/* "${pkgdir}/usr/share/${_pkgname}"
	mv "${pkgdir}/usr/share/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
