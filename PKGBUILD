# shellcheck shell=bash
# shellcheck disable=SC2034,SC2148,SC2154
# Maintainer: Zeke Sonxx <zeke@zekesonxx.com>
# 2.0-pre2.1
pkgname=blt4l
pkgver=2.0_rc1
pkgrel=1
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
__steamrtfilename="blt4l_${pkgver//_/-}-2-gf87991a_Ubuntu_Precise_.SteamRT"
source=("blt4l::git+https://github.com/blt4linux/blt4l#tag=${pkgver//_/-}"
		"https://raw.githubusercontent.com/blt4linux/blt4l_launcher/6d3da8df567f9d541df8fc10194febf19a80afde/blt4l.sh"
		"https://github.com/blt4linux/blt4l/releases/download/${pkgver//_/-}/${__steamrtfilename}.tar.xz")
noextract=()
md5sums=('SKIP'
         '0c01af7e5ddb43fb7d860878b1fa7e73'
         'b37d19c997ce938e19134c1ea16908ff')
sha512sums=('SKIP'
            'ef7bbcd9049bd8424cf8f5430c9528e4489fb03be77ded164eb5361051d1eadfaa5d48437089bd3acfd7970f167a0e310cb4c777dcacbe66dafc197529b9fe27'
            '33b8ed333d8cc0e1ad2333c026d2439aa4bad009498bc2ee4e6bf3e2b00edcb8604b217def6052bce49d0e2e4d8244b5dc29e550104d1a95daf9aeaf920fd3c1')

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
