# Maintainer: mickybart <mickybart@pygoscelis.org>

_emulator=snes9x2010
pkgname=kodi-addon-game-libretro-$_emulator-git
pkgver=r49.a815363
pkgrel=1
pkgdesc="Snes9X Next GameClient for Kodi"
arch=('armv7h' 'x86_64')
url='https://github.com/kodi-game/game.libretro.snes9x2010'
license=('GPL')
groups=('kodi-addons')
depends=('kodi-platform' 'kodi-addon-game-libretro' 'libretro-snes9x2010-git')
makedepends=('git' 'cmake' 'kodi-dev')
source=("$pkgname::git+https://github.com/kodi-game/game.libretro.snes9x2010.git#branch=master"
	'libretro-snes9x2010-config.cmake')
sha256sums=('SKIP'
	    '941db1c0738f12aaba11ee98908f90254c808eb5a36eaf807dc3dd66e0132b08')

pkgver() {
	cd "$pkgname"
	_revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
	echo "$_revision"
}

prepare() {
  [[ -d kodi-addons-build ]] && rm -rf kodi-addons-build
  mkdir kodi-addons-build

  ## Copy CMakeLists.txt from depends
  #cp -f $pkgname/depends/common/$_emulator/CMakeLists.txt $_emulator/
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
	rm -f "$pkgdir/usr/share/kodi/addons/game.libretro.$_emulator/game.libretro.$_emulator.so"
	ln -s "/usr/lib/libretro/${_emulator}_libretro.so" "$pkgdir/usr/share/kodi/addons/game.libretro.$_emulator/game.libretro.$_emulator.so"
}
