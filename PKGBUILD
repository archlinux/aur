# Maintainer: sdvcrx <memory.silentvoyage at gmail dot com>
# Contributor::  Xiaoxiao Pu <i@patme.net>

pkgname=sdlpal-git
pkgver=20210211
pkgrel=1
pkgdesc="A SDL-based reimplemention of the classic Chinese-language RPG 'Xian Jian Qi Xia Zhuan'"
arch=('i686' 'x86_64')
url="https://github.com/sdlpal/sdlpal"
license=('GPL')
depends=('sdl2' 'xdg-utils')
makedepends=('git' 'imagemagick')
install="sdlpal.install"
source=("sdlpal::git+https://github.com/sdlpal/sdlpal.git"
        "SDL::git+https://github.com/sdlpal/SDL.git"
        "googletest::git+https://github.com/sdlpal/googletest.git"
        "mingw-std-threads::git+https://github.com/sdlpal/mingw-std-threads.git"
        "scripts::git+https://github.com/sdlpal/scripts.git"
        "sdlpal.sh"
        "sdlpal.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '4f3b8446705af5decf25d00b54123875b9a79ae43cf70aa641c1028c29d2d547'
            '47bef648b2bb5da35912d9b5bd6b4e47f0767f125465068c7b96bb437b4fb6e3')

prepare() {
    cd "${srcdir}/sdlpal"
    git submodule init
    git config submodule.3rd/SDL.url "$srcdir/SDL"
    git config submodule.3rd/googletest.url "$srcdir/googletest"
    git config submodule.3rd/mingw-std-threads.url "$srcdir/mingw-std-threads"
    git config submodule.scripts.url "$srcdir/scripts"
    git submodule update
}

build() {
	cd "${srcdir}/sdlpal/unix"
	make
}

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/sdlpal"
	# install executable files
	install -Dm755 "sdlpal.sh" "${pkgdir}/usr/bin/sdlpal"
	install -Dm755 "${srcdir}/sdlpal/unix/sdlpal" "${pkgdir}/usr/share/sdlpal/sdlpal"
	# install desktop file
	install -Dm644 "sdlpal.desktop" "${pkgdir}/usr/share/applications/sdlpal.desktop"
	# install icons
	for size in 16 22 24 32 48 64; do
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
		convert -resize "${size}" "${srcdir}/sdlpal/sdlpal.ico" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/sdlpal.png"
	done
	#install -Dm644 sdlpal.xpm "${pkgdir}/usr/share/icons/scalable/apps/sdlpal.xpm"
}
