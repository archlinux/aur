# Maintainer: Madeline Mewmews <maddie at mewmews dot gay>
# Maintainer: bemxio <bemxiov at protonmail dot com>
# Contributor: Harrison <htv04rules at gmail dot com>

_pkgname=sm64coopdx
pkgname="${_pkgname}-git"

pkgdesc="Fork of Super Mario 64 Co-op with more features, customizability and power to the Lua API"

pkgver=1.5.1.r135.gdf18593
pkgrel=1
epoch=2

arch=(x86_64 i686 pentium4 aarch64 armv7h)

url="https://sm64coopdx.com/"
#license=("LicenseRef-unknown")

depends=(sdl2)
makedepends=(git "python>=3.6" glew zlib curl audiofile gendesk)

provides=("${_pkgname}=${pkgver}")

source=("git+https://github.com/coop-deluxe/${_pkgname}.git#branch=dev" "${_pkgname}.sh")
md5sums=(SKIP 314f0815dc7132df21bbd3a9d391f2be)

#options=("!strip")

pkgver() {
  	# move to source directory
	cd "${_pkgname}"

	# use most recent tag reachable from current commit
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	# generate desktop entry
	gendesk -f -n \
		--pkgname "Super Mario 64 Co-op Deluxe" \
		--pkgdesc "${pkgdesc}" \
		--exec "${_pkgname}" \
		--icon "${_pkgname}.png" \
		--categories "Game;ActionGame;AdventureGame"
}

build() {
	# move to source directory
	cd "${_pkgname}"

	# build project
	make
}

package() {
	# move to build directory
	cd "${_pkgname}/build/us_pc"

	# copy main executable
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"

	# copy shared libraries
	find . -type f -name '*.so' -exec install -Dm755 {} "${pkgdir}/usr/lib/${_pkgname}/{}" \;

	# copy other project directories
	find lang -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/{}" \;
	find dynos -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/{}" \;
	find mods -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/{}" \;

	# copy executable script
	install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

	# copy icon and desktop entry
	install -Dm644 "${srcdir}/${_pkgname}/res/icon.icon/Assets/icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 "${srcdir}/Super Mario 64 Co-op Deluxe.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
