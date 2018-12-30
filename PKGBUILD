# Maintainer: Dominic Radermacher <dominic.radermacher@gmail.com>

pkgname=dxx-rebirth
pkgver=0.59.100.r1109.ga02ad8b16
pkgrel=1
pkgdesc="An enhanced engine to play Descent 1 / Descent 2"
arch=('i686' 'x86_64')
url="http://www.dxx-rebirth.com/"
license=('custom:D1x' 'LGPL' 'custom:as-is')
depends=('sdl' 'sdl_mixer' 'mesa' 'physfs')
makedepends=('scons' 'unzip')
conflicts=('d1x-rebirth' 'd2x-rebirth')
replaces=('d1x-rebirth' 'd2x-rebirth')
install=${pkgname}.install
source=(git+https://github.com/dxx-rebirth/dxx-rebirth.git)
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${pkgname}"
	sed -ie "/^PREFIX =/s|/usr/local/|/usr/|" SConstruct
	scons sharepath="/usr/share/${pkgname}"
}

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

	install -m755 "${srcdir}/${pkgname}/d1x-rebirth/d1x-rebirth" "${pkgdir}/usr/bin/"
	install -m755 "${srcdir}/${pkgname}/d2x-rebirth/d2x-rebirth" "${pkgdir}/usr/bin/"

	install -m644 "${srcdir}/${pkgname}/d1x-rebirth/d1x-rebirth.xpm" "${pkgdir}/usr/share/pixmaps/"
	install -m644 "${srcdir}/${pkgname}/d2x-rebirth/d2x-rebirth.xpm" "${pkgdir}/usr/share/pixmaps/"

	install -m644 "${srcdir}/${pkgname}/d1x-rebirth/d1x-rebirth.desktop" "${pkgdir}/usr/share/applications/"
	install -m644 "${srcdir}/${pkgname}/d2x-rebirth/d2x-rebirth.desktop" "${pkgdir}/usr/share/applications/"

	install -m644 "${srcdir}/${pkgname}/COPYING.txt" "${pkgdir}/usr/share/licenses/$pkgname/"
#	install -m644 "${srcdir}/d2xr-sc55-music.dxa" "${pkgdir}/usr/share/${pkgname}/"
} 
