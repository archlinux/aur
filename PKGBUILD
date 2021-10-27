# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=(xcursor-hackneyed-light xcursor-hackneyed-dark)
pkgbase=xcursor-hackneyed
pkgdesc='Cursor theme inspired by Windows 3.x with high-contrast and sensible use of colors'
pkgver=0.8.2
pkgrel=1
url=https://gitlab.com/Enthymeme/hackneyed-x11-cursors/
license=(custom:MIT)
arch=(any)
makedepends=(make xorg-xcursorgen 'inkscape>=1.0' 'imagemagick>=6.8.6')
source=("${url}/-/archive/${pkgver}/hackneyed-x11-cursors-${pkgver}.tar.bz2")
sha512sums=('d4b3afe3f663e957a7b95858b893193532c47951641daab763cb8e63fa5c910ad084729442b641720dfa2863afb222ab7f414ca234928a0eb2201219340a23ac')

build () {
	cd "hackneyed-x11-cursors-${pkgver}"

	# Normal light variant.
	make -j$(nproc) dist dist.left PREFIX=/usr
	make install PREFIX=/usr DESTDIR="$(pwd)/_light"
	make clean PREFIX=/usr

	# Dark variant.
	make -j$(nproc) dist dist.left PREFIX=/usr \
		THEME_NAME=Hackneyed-Dark \
		COMMON_SOURCE=theme/common-dark.svg \
		RSVG_SOURCE=theme/right-handed-dark.svg \
		LSVG_SOURCE=theme/left-handed-dark.svg
	make install PREFIX=/usr THEME_NAME=Hackneyed-Dark DESTDIR="$(pwd)/_dark"
	make clean PREFIX=/usr THEME_NAME=Hackneyed-Dark
}

_package_common () {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_xcursor-hackneyed-light () {
	replaces=(xcursor-hackneyed)
	conflicts=(xcursor-hackneyed)

	cd "hackneyed-x11-cursors-${pkgver}"
	cp -a _light/* "${pkgdir}"
	_package_common
}

package_xcursor-hackneyed-dark () {
	pkgdesc="${pkgdesc} (dark variant)"

	cd "hackneyed-x11-cursors-${pkgver}"
	cp -a _dark/* "${pkgdir}"
	_package_common
}
