# Maintainer: su226 <thesu226 at outlook dot com>

pkgname=techmino
pkgver="0.17.15"
_ccloader_ver="11.4.1"
_zframework_ver="c498582a8cb9ddf3954c4538d383342c1ce14e88"
_coldclear_ver="23c1cd6e4aa44f2a61daa839ae08dfd3cd5f9da3"
pkgrel=1
epoch=
pkgdesc="A collection of various modern block game rules, more ways to play, and some new things added for a new experience."
arch=(x86_64)
# HTTPS cert of https://www.studio26f.org has expired since 2023-11-29 :/
url="https://github.com/26F-Studio/Techmino"
license=("LGPL3")
groups=()
depends=(love)
# Build ColdClear depends rust.
makedepends=(git rust)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("techmino-$pkgver.tar.gz::https://github.com/26F-Studio/Techmino/archive/refs/tags/v$pkgver.tar.gz"
        "ccloader-$_ccloader_ver.tar.gz::https://github.com/26F-Studio/cold_clear_ai_love2d_wrapper/archive/refs/tags/$_ccloader_ver.tar.gz"
        "git+https://github.com/26F-Studio/Zframework.git#tag=$_zframework_ver"
        "git+https://github.com/26F-Studio/cold-clear.git#tag=$_coldclear_ver"
        "techmino.sh"
        "techmino.desktop")
noextract=()
sha256sums=("846214d06a372cb12a9ba44610342fda9cfe2cb45d44a4a7919eae7d28beaffb"
            "7fb201662c297ec6838db0f389718cd01ae615244b603030ab9c1a1bd089ddd0"
            SKIP
            SKIP
            "9c8ac53a1264722b037ee8c72f5d0bc187ef9d106a3c2f949fb20537fb4c95f7"
            "d08469240ce6e919f250a205a47b9916bbdb464604d198f4fb8b37b91212da5e")
validpgpkeys=()

prepare() {
	cd "$srcdir/Techmino-$pkgver"
	rmdir Zframework
	ln -s ../Zframework .
	cd "$srcdir/cold_clear_ai_love2d_wrapper-$_ccloader_ver"
	rmdir cold-clear
	ln -s ../cold-clear .
}

build() {
	cd "$srcdir/cold_clear_ai_love2d_wrapper-$_ccloader_ver"
	make build/Linux/x64/CCloader.so
	cd "$srcdir/Techmino-$pkgver"
	ln -sf ../../.github/build/linux/release/icon.png media/image/icon.png
	bsdtar --format zip --exclude-vcs -Lcf techmino.love media parts Zframework conf.lua main.lua version.lua
}

package() {
	install -Dm644 "$srcdir/cold_clear_ai_love2d_wrapper-$_ccloader_ver/build/Linux/x64/CCloader.so" "$pkgdir/usr/lib/techmino/CCloader.so"
	install -Dm644 "$srcdir/Techmino-$pkgver/techmino.love" "$pkgdir/usr/lib/techmino/techmino.love"
	install -Dm755 "$srcdir/techmino.sh" "$pkgdir/usr/lib/techmino/techmino"
	install -Dm644 "$srcdir/techmino.desktop" "$pkgdir/usr/share/applications/techmino.desktop"
	install -Dm644 "$srcdir/Techmino-$pkgver/.github/build/linux/release/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/techmino.png"
	install -Dm644 "$srcdir/Techmino-$pkgver/license.txt" "$pkgdir/usr/share/licenses/techmino/LICENSE"
	install -Dm644 "$srcdir/Techmino-$pkgver/legals.md" "$pkgdir/usr/share/licenses/techmino/LICENSE-THIRD-PARTY"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/usr/lib/techmino/techmino" "$pkgdir/usr/bin/techmino"
}
