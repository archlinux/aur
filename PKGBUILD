# Maintainer: mickybart <mickybart@pygoscelis.org>

_emulator=genplus
_libretro_pkg=libretro-genesis-plus-gx-git

pkgname=kodi-addon-game-libretro-$_emulator-git
pkgver=r50.65cb1b1
pkgrel=1
pkgdesc="Genesis Plus GX GameClient for XBMC"
arch=('armv7h' 'x86_64')
url="https://github.com/kodi-game/game.libretro.$_emulator"
license=('GPL')
groups=('kodi-addons')
depends=('kodi-platform' 'kodi-addon-game-libretro' "$_libretro_pkg")
makedepends=('git' 'cmake' 'kodi-dev')
source=("$pkgname::git+https://github.com/kodi-game/game.libretro.$_emulator.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	_revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
	echo "$_revision"
}

_get_libretro_so() {
	pacman -Ql $_libretro_pkg | grep '_libretro.so' | head -1 | cut -d' ' -f2
}

prepare() {
	[[ -d kodi-addons-build ]] && rm -rf kodi-addons-build
	mkdir kodi-addons-build

	# Generate cmake config for libretro emulator

	_lib=$(echo ${_emulator}_LIB | tr 'a-z' 'A-Z')
	_so=$(_get_libretro_so)
	echo "set($_lib $_so)" > libretro-$_emulator-config.cmake 
}

build() {
	cd kodi-addons-build
	cmake \
		-DCMAKE_PREFIX_PATH="../" \
		-DCMAKE_INSTALL_PREFIX=/usr/share/kodi/addons/ \
		-DCMAKE_BUILD_TYPE=Release \
		-DPACKAGE_ZIP=1 \
		"../$pkgname"
	make
}

package() {
	cd kodi-addons-build
	make DESTDIR="$pkgdir/" install

	# Override the copy to use a symlink
	_so=$(_get_libretro_so)
	rm -f "$pkgdir/usr/share/kodi/addons/game.libretro.$_emulator/game.libretro.$_emulator.so"
	ln -s "$_so" "$pkgdir/usr/share/kodi/addons/game.libretro.$_emulator/game.libretro.$_emulator.so"
}
