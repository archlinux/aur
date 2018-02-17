# Maintainer: mickybart <mickybart@pygoscelis.org>

pkgname=kodi-addon-game-libretro-only-git
pkgver=r228.e0ec93c
pkgrel=1
pkgdesc="Libretro compatibility layer for the Kodi Game API (only game.libretro. see other addons)"
arch=('armv7h' 'x86_64')
url='https://github.com/kodi-game/game.libretro'
license=('GPL')
groups=('kodi-addons')
depends=('kodi-platform')
provides=('kodi-addon-game-libretro')
makedepends=('git' 'cmake' 'kodi-dev')
source=("$pkgname::git+https://github.com/kodi-game/game.libretro.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	_revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
	echo "$_revision"
}

prepare() {
  [[ -d kodi-addons-build ]] && rm -rf kodi-addons-build
  mkdir kodi-addons-build
}

build() {
	cd kodi-addons-build
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr/share/kodi/addons/ \
		-DCMAKE_BUILD_TYPE=Release \
		-DPACKAGE_ZIP=1 \
		"../$pkgname"
	make
}

package() {
	cd kodi-addons-build
	make DESTDIR="$pkgdir/" install
}
