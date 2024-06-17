# Maintainer: Madeline Mewmews <maddie at mewmews dot gay>
# Maintainer: bemxio <bemxiov at protonmail dot com>
# Contributor: Harrison <htv04rules at gmail dot com>

pkgname="sm64coopdx-git"
pkgdesc="Fork of Super Mario 64 Co-op with more features, customizability and power to the Lua API"

_region="us" # change this (as well as the 2nd checksum in line 28) if you want to use a different ROM

pkgver=r3689.30ccad3
pkgrel=3
epoch=1

arch=(x86_64 i686 pentium4 aarch64 armv7h)

url="https://sm64coopdx.com/"
#license=("LicenseRef-unknown")

depends=(sdl2)
makedepends=(git "python>=3.6" glew zlib curl audiofile gendesk)

provides=(sm64coopdx)
#conflicts=()

DLAGENTS=("file::/usr/bin/echo Could not find %u. Please download it to `$(pwd)` in order to build the package.")

source=("git+https://github.com/coop-deluxe/sm64coopdx.git" "file://baserom.${_region}.z64" "sm64coopdx.sh" "sm64coopdx.png")
md5sums=("SKIP" "20b854b239203baf6c961b850a4a51a2" "84fd37eacc71065d03ccad67cb35f699" "9bec90a66559edbf42992c4985e4548a")

options=("!strip")

pkgver() {
  	# move to the source directory
	cd sm64coopdx

	# use the number of revisions since beginning of the history
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	# copy the ROM to the source directory
	cp "baserom.${_region}.z64" "sm64coopdx/baserom.${_region}.z64"

	# generate a .desktop file
	gendesk -f -n \
		--pkgname "Super Mario 64 Co-op Deluxe" \
		--pkgdesc "${pkgdesc}" \
		--exec sm64coopdx \
		--icon sm64coopdx.png \
		--categories "Game;ActionGame;AdventureGame"
}

build() {
	# move to the source directory
	cd sm64coopdx

	# build the game
	make VERSION="${_region}"
}

package() {
	# move to the build directory
	cd "sm64coopdx/build/${_region}_pc"

	# copy the main executable
	install -Dm755 sm64coopdx "${pkgdir}/usr/share/sm64coopdx/sm64coopdx"

	# copy the shared libraries
	find . -type f -name "*.so" -exec install -Dm755 {} "${pkgdir}/usr/lib/sm64coopdx/{}" \;

	# copy the other directories
	find lang -type f -exec install -Dm644 {} "${pkgdir}/usr/share/sm64coopdx/{}" \;
	find dynos -type f -exec install -Dm644 {} "${pkgdir}/usr/share/sm64coopdx/{}" \;
	find mods -type f -exec install -Dm644 {} "${pkgdir}/usr/share/sm64coopdx/{}" \;

	# copy the script
	install -Dm755 "${srcdir}/sm64coopdx.sh" "${pkgdir}/usr/bin/sm64coopdx"

	# copy the icon and the .desktop file
	install -Dm644 "${srcdir}/sm64coopdx.png" "${pkgdir}/usr/share/pixmaps/sm64coopdx.png"
	install -Dm644 "${srcdir}/Super Mario 64 Co-op Deluxe.desktop" "${pkgdir}/usr/share/applications/sm64coopdx.desktop"
}