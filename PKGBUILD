# Maintainer: Madeline Mewmews <maddie at mewmews dot gay>
# Maintainer: bemxio <bemxiov at protonmail dot com>
# Contributor: Harrison <htv04rules at gmail dot com>

pkgname="sm64coopdx-git"
pkgdesc="A fork of sm64ex-coop with more features, customizability and power to the Lua API"

_region="us" # change this (as well as the 2nd checksum in line 25) if you want to use a different ROM

pkgver=r3689.30ccad3
pkgrel=1
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
md5sums=("SKIP" "20b854b239203baf6c961b850a4a51a2" "fda12fe3e7f38cf15273bd5cd47448f0" "9bec90a66559edbf42992c4985e4548a")

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
		--pkgname "Super Mario 64 Coop Deluxe" \
		--pkgdesc "${pkgdesc}" \
		--exec sm64coopdx \
		--icon sm64coopdx.png \
		--categories "Game;ActionGame;AdventureGame"
}

build() {
	# move to the source directory
	cd sm64coopdx

	# build the game
	make
}

package() {
	# move to the build directory
	cd "sm64coopdx/build/${_region}_pc"

	# copy all of the built files
	find . -type f \
		-not -name "sm64coopdx" \
		-exec install -Dm644 {} "${pkgdir}/usr/share/sm64coopdx/{}" \;

	install -Dm755 sm64coopdx "${pkgdir}/usr/share/sm64coopdx/sm64coopdx"

	# copy the script
	install -Dm755 "${srcdir}/sm64coopdx.sh" "${pkgdir}/usr/bin/sm64coopdx"

	# copy the icon and the .desktop file
	install -Dm644 "${srcdir}/sm64coopdx.png" "${pkgdir}/usr/share/pixmaps/sm64coopdx.png"
	install -Dm644 "${srcdir}/sm64coopdx.desktop" "${pkgdir}/usr/share/applications/sm64coopdx.desktop"
}