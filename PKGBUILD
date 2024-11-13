# Maintainer: su226 <thesu226 at outlook dot com>

pkgname=techmino
pkgver="0.17.21"
_ccloader_ver="11.5"
_coldclear_ver="23c1cd6e4aa44f2a61daa839ae08dfd3cd5f9da3"
pkgrel=2
epoch=
pkgdesc="A collection of various modern block game rules, more ways to play, and some new things added for a new experience."
arch=(x86_64)
url="https://www.studio26f.org"
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
        "git+https://github.com/26F-Studio/cold-clear.git#tag=$_coldclear_ver"
        "techmino.sh"
        "techmino.desktop")
noextract=()
sha256sums=("b887cf9e6685759ee881527a8dcd5ea28555543a901f72dd2ebdf796e1308141"
            "64a5ae611befcaaac3f254f7623b5504d76984e09911c2f0aa1525665d0deb65"
            SKIP
            "9c8ac53a1264722b037ee8c72f5d0bc187ef9d106a3c2f949fb20537fb4c95f7"
            "d08469240ce6e919f250a205a47b9916bbdb464604d198f4fb8b37b91212da5e")
validpgpkeys=()

prepare() {
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
