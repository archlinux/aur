# shellcheck shell=bash
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
# 2.0-pre2.1
pkgname=blt4l
pkgver=2.0_pre2_r1
pkgrel=2
pkgdesc="Mod loader for Payday 2"
arch=('i686' 'x86_64')
url="https://github.com/blt4linux/blt4l"
license=('GPL3')
groups=()
depends=('curl' 'openssl' 'zlib' 'zenity')
makedepends=('git' 'cmake')
provides=()
conflicts=("blt4l-git")
replaces=("blt4l-runtime-bin")
backup=()
options=()
install=blt4l.install
__steamrtfilename="blt4l_${pkgver//_/-}_Ubuntu_Precise_.SteamRT"
source=("blt4l::git+https://github.com/blt4linux/blt4l#tag=${pkgver//_/-}"
		"https://raw.githubusercontent.com/blt4linux/blt4l_launcher/6d3da8df567f9d541df8fc10194febf19a80afde/blt4l.sh"
		"https://github.com/blt4linux/blt4l/releases/download/${pkgver//_/-}/${__steamrtfilename}.tar.xz")
noextract=()
md5sums=('SKIP'
         '0c01af7e5ddb43fb7d860878b1fa7e73'
         '09ed0bc01c5317e7d445311aac622207')
sha512sums=('SKIP'
            'ef7bbcd9049bd8424cf8f5430c9528e4489fb03be77ded164eb5361051d1eadfaa5d48437089bd3acfd7970f167a0e310cb4c777dcacbe66dafc197529b9fe27'
            '3d4e9ca92e4fb8e6c504e7297f0792e49f89b7a3f31eb1203c4f78570103a2dda054b91a13abff09244a7d338af66bc83e971efdc23b9a5b9aa199160ac6717b')

prepare() {
	cd "$srcdir/blt4l" || exit
	git submodule init
	git submodule update
}

build() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build" || exit
	cmake "$srcdir/blt4l"
	make
}

package() {
	# Compiled binary
	install -D -m644 "${srcdir}/build/libblt_loader.so" "${pkgdir}/usr/lib/blt4l/libblt_loader.so"

	# Steam Runtime binary
	install -D -m644 "${srcdir}/${__steamrtfilename//.SteamRT/(SteamRT)}/libblt_loader.so" "${pkgdir}/usr/lib/blt4l/libblt_loader_steamrt.so"

	# Launcher
	install -D -m755 "${srcdir}/blt4l.sh" "${pkgdir}/usr/bin/blt4l"

	# Mods Folder
	cp -r "${srcdir}/blt4l/lua/Payday-2-BLT-Lua/mods/" "${pkgdir}/usr/lib/blt4l/mods/"
	chmod -R 755 "${pkgdir}/usr/lib/blt4l/mods/"
}
