# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=gwenhael-le-moine
_githubrepo=x48ng
_gitcommit=9f2e2fc6747fc8e2608756d2d885496e89787320

pkgname=x48ng-git
pkgver=0.30.0.r1.9f2e2fc
pkgrel=1
pkgdesc='A reboot of the x48 HP 48 emulator'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL2')
depends=('readline' 'ncurses' 'sdl12-compat' 'sdl_gfx' 'libx11' 'libxext' 'xterm' 'xorg-mkfontscale' 'xorg-fonts-misc')
makedepends=('git' 'lua')
install="${pkgname}.install"
provides=('x48ng')
conflicts=('x48ng')
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}" 'runtime_options.c_1.patch' 'ui_text.c_1.patch')
sha256sums=('SKIP'
            '995ede538e1a5aecabdfe2d7d0fa45277f8cfc5c16ed467d2a74a7375a5d1e3d'
            '94550704486e179bf0e1495b5fb6fc55c9663fe61d6e44dd45cff8bfe840f301')

build() {
	cd "${_githubrepo}"
	# sed -i 's|<ncursesw/curses.h>|<curses.h>|g' src/ui_text.c
	patch --forward --strip=1 --input="${srcdir}/runtime_options.c_1.patch"
	patch --forward --strip=1 --input="${srcdir}/ui_text.c_1.patch"
	make clean-all && make GUI=x11
}

package() {
	cd "${_githubrepo}"
	make DESTDIR="${pkgdir}/" install
        install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/x48ng/LICENSE"
}
