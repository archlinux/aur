# Maintainer: Madeline Mewmews <maddie at mewmews dot gay>
# Maintainer: bemxio <bemxiov at protonmail dot com>
# Contributor: Harrison <htv04rules at gmail dot com>

_pkgname=sm64coopdx
pkgname="${_pkgname}-git"

pkgdesc="Fork of Super Mario 64 Co-op with more features, customizability and power to the Lua API"

pkgver=r5064.23d8a73
pkgrel=1
epoch=1

arch=(x86_64 i686 pentium4 aarch64 armv7h)

url="https://sm64coopdx.com/"
#license=("LicenseRef-unknown")

depends=(sdl2)
makedepends=(git "python>=3.6" glew zlib curl audiofile gendesk)

provides=("${_pkgname}=${pkgver}")

source=("git+https://github.com/coop-deluxe/${_pkgname}.git#branch=dev" "${_pkgname}.sh" "${_pkgname}.png")
md5sums=(SKIP 314f0815dc7132df21bbd3a9d391f2be 9bec90a66559edbf42992c4985e4548a)

#options=("!strip")

pkgver() {
  	# move to source directory
	cd "${_pkgname}"

	# use number of revisions since beginning of history
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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

	# build sm64coopdx
	make
}

package() {
	# move to build directory
	cd "${_pkgname}/build/us_pc"

	# copy game executable
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"

	# copy shared libraries
	find . -type f -name '*.so' -exec install -Dm755 {} "${pkgdir}/usr/lib/${_pkgname}/{}" \;

	# copy other game directories
	find lang -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/{}" \;
	find dynos -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/{}" \;
	find mods -type f -exec install -Dm644 {} "${pkgdir}/usr/share/${_pkgname}/{}" \;

	# copy executable script
	install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

	# copy icon and desktop entry
	install -Dm644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
	install -Dm644 "${srcdir}/Super Mario 64 Co-op Deluxe.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
