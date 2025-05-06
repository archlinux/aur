# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='Tool for working with NewGRF mod files for OpenTTD'
pkgname=yagl
pkgver=1.2.3
pkgrel=1
url=https://github.com/UnicycleBloke/yagl
license=(GPL-3.0-or-later)
arch=(x86_64)
# TODO: Use system-provided catch2 and cxxopts.
makedepends=(python cmake ninja git png++)
depends=(libpng)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        missing-cstdint-include.patch
		cmake-unbundle-syslibs.patch)
sha512sums=('67ae8e63a2d4261aa653c36658d4dea7661dbf4b54180944517e1915a40bc07bbb9fdc57b8d9eddcc55b8dc80403caf41f2bbc9979fc707ccbffc33b058c54d4'
            '9fdb9b5d56d8b601f2db1ef9965962d478dd7313a457c8e2718af1031697f78e59f77b44c3b5f13d5603704735cd1c724dbc1e17e13ebcd6b16fa2aba52f798a'
            '02be37264b6adf801e77e2d1ea9182ab18aec678dd5a3773b4c7e8f2b3876c94502282ef4cab5dc4c811c67b7348ff3ec540a40821a4f87c2b49d2055e2bf515')

prepare () {
	cd "${pkgname}-${pkgver}"
	patch -p1 < "$srcdir/missing-cstdint-include.patch"
	patch -p1 < "$srcdir/cmake-unbundle-syslibs.patch"
}

build () {
	cd "${pkgname}-${pkgver}"
	cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -S. -B_build
	cmake --build _build
}

package () {
	# There is no "install" target, make do by hand.
	cd "${pkgname}-${pkgver}"
	install -Dm755 -t "${pkgdir}/usr/bin" _build/yagl
	install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" README.md
}

check () {
	cd "${pkgname}-${pkgver}"
	./_build/yagl_tests --wait-for-keypress never
}

