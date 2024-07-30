# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=sdl-jstest-git
pkgver=0.2.2.r24.g60f6e62
epoch=1
pkgrel=1
pkgdesc="Simple SDL joystick test application for the command line."
url="https://github.com/Grumbel/sdl-jstest"
arch=('x86_64' 'i686')
license=('GPL-3.0-or-later')
depends=('sdl' 'sdl2' 'ncurses' 'hicolor-icon-theme')
makedepends=('git' 'cmake')
provides=('sdl-jstest')
install="${pkgname}.install"
source=('git+https://github.com/Grumbel/sdl-jstest' 'git+https://github.com/grumbel/tinycmmc.git' 'git+https://github.com/gabomdq/SDL_GameControllerDB')
sha512sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname%-git}"
	git submodule init
	git config submodule.external/tinycmmc.url "$srcdir/tinycmmc"
	git config submodule.external/sdl_gamecontrollerdb.url "$srcdir/SDL_GameControllerDB"
	git -c protocol.file.allow=always submodule update
}

build() {
	cmake -B build -S "${pkgname%-git}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
DESTDIR="$pkgdir" cmake --install build
}
