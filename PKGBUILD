# Maintainer: Jonathon Fernyhough <jonathon at_manjaro_org>

pkgname=swatchbooker-git
_pkgname=SwatchBooker
pkgver=latest
pkgrel=1
pkgdesc='Colour swatch book viewer/convertor/editor'
arch=('any')
url='http://www.selapa.net/swatchbooker/'
license=('GPL3')
depends=('python2' 'python2-pyqt4')
makedepends=('git')
provides=("${pkgname/-git/}")
conflicts=("${pkgname/-git/}")
source=("${_pkgname}::git+https://github.com/olivierberten/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	# https://wiki.archlinux.org/index.php/VCS_package_guidelines#The_pkgver.28.29_function
	( set -o pipefail
		git describe --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
    cd "${srcdir}/${_pkgname}"
    python2 ./setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python2 ./setup.py install -O2 --prefix="${pkgdir}"/usr

	# Tidy
	rm "${pkgdir}"/usr/bin/swatchbooker_w32_postinst.py

	# Fix up
	chmod a+x "${pkgdir}"/usr/bin/*
	for exe in "${pkgdir}"/usr/bin/*; do
		sed -i '4s|python|python2|' "$exe"
	done
}
