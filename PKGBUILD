_pkgname=washdc
_previousname=washingtondc
pkgname=${_pkgname}-git
pkgver=r2627.cd565102
pkgrel=1
pkgdesc='Open-source Sega Dreamcast emulator'
arch=('x86_64')
url='https://washemu.org/'
license=('GPL3')
makedepends=('git' 'cmake')
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("git+https://gitlab.com/washemu/${_pkgname}.git"
        "${_pkgname}.install")
md5sums=('SKIP'
         '0dc7fd8f2618c05371d66dc1882a5725')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule init
	git submodule update --recursive
}

build() {
	cd "${srcdir}/${_pkgname}"
	mkdir -p build
	cd build
	cmake .. \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DINVARIANTS=Off \
		-DENABLE_DEBUGGER=Off
	make
}

package() {
	install -Dm755 "${srcdir}/${_pkgname}/build/src/${_previousname}/${_previousname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/${_pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
