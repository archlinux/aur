# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=(xcursor-hackneyed-light xcursor-hackneyed-dark)
pkgbase=xcursor-hackneyed
pkgdesc='Cursor theme inspired by Windows 3.x with high-contrast and sensible use of colors'
pkgver=0.8
pkgrel=2
url=https://gitlab.com/Enthymeme/hackneyed-x11-cursors/
license=(custom:MIT)
arch=(any)
makedepends=(make xorg-xcursorgen 'inkscape>=0.48.4' 'imagemagick>=6.8.6')
source=("${url}/-/archive/${pkgver}/hackneyed-x11-cursors-${pkgver}.tar.bz2")
sha512sums=('90fef39c02242ad51eb23cadc1afb90bd1df2428eba82a30860cb52e16bac237fb7bde11d5c917791c109a1d2b2c461c3352e4c11be3a4bd4e625656496a3d3f')

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
