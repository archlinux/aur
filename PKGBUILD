# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=thextech-adventuresofdemo
pkgver=1.3.5.3
pkgrel=1
pkgdesc="The full port of the SMBX engine from VB6 into C++ and SDL2, FreeImage and MixerX, with AoD game assets."
arch=('i386' 'x86_64' 'aarch64')
url="https://github.com/Wohlstand/TheXTech"
license=('GPL')
depends=('desktop-file-utils')
makedepends=('git' 'cmake' 'sdl2' 'libpng' 'libjpeg-turbo')
optdepends=()
provides=('thextech')
install=${pkgname}.install
source=("git://github.com/Wohlstand/TheXTech"
"https://wohlsoft.ru/projects/TheXTech/_downloads/thextech-adventure-of-demo-assets-full.7z"
"thextech-adventuresofdemo.desktop")
sha256sums=("SKIP"
"SKIP"
"46731b984b5c278528b85d0293c9aea1c85685c96cd3771b1e726c919e17de32")
noextract=()

prepare() {
	cd "${srcdir}/TheXTech"
    git submodule init
    git submodule update
}

build() {
	cd "${srcdir}/TheXTech"
	mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=MinSizeRel -DUSE_SYSTEM_SDL2=OFF -DUSE_SYSTEM_LIBS=OFF -DUSE_STATIC_LIBC=ON -DPGE_SHARED_SDLMIXER=OFF -DTHEXTECH_FIXED_ASSETS_PATH=/usr/share/games/thextech-aod -DTHEXTECH_USER_DIR_NAME=.thextech-aod ..
    CFLAGS="-march=native -mtune=generic -O2 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2  -fstack-clash-protection -fcf-protection" CXXFLAGS="-march=native -mtune=generic -O2 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -fstack-clash-protection -fcf-protection -Wp,-D_GLIBCXX_ASSERTIONS" make
}

package() {
    mkdir -p "${pkgdir}/usr/share/games/thextech-aod"
    cp -r "${srcdir}/battle" "${pkgdir}/usr/share/games/thextech-aod/battle"
    cp -r "${srcdir}/graphics" "${pkgdir}/usr/share/games/thextech-aod/graphics"
    cp -r "${srcdir}/music" "${pkgdir}/usr/share/games/thextech-aod/music"
    cp -r "${srcdir}/sound" "${pkgdir}/usr/share/games/thextech-aod/sound"
    cp -r "${srcdir}/worlds" "${pkgdir}/usr/share/games/thextech-aod/worlds"
    install -Dm0644 "${srcdir}/gameinfo.ini" "${pkgdir}/usr/share/games/thextech-aod/gameinfo.ini"
    install -Dm0644 "${srcdir}/music.ini" "${pkgdir}/usr/share/games/thextech-aod/music.ini"
    install -Dm0644 "${srcdir}/sounds.ini" "${pkgdir}/usr/share/games/thextech-aod/sounds.ini"
    install -Dm0644 "${srcdir}/thextech.ini" "${pkgdir}/usr/share/games/thextech-aod/thextech.ini"
    install -Dm0644 "${srcdir}/intro.lvlx" "${pkgdir}/usr/share/games/thextech-aod/intro.lvlx"
    install -Dm0644 "${srcdir}/outro.lvlx" "${pkgdir}/usr/share/games/thextech-aod/outro.lvlx"
    install -Dm0644 "${srcdir}/credits.txt" "${pkgdir}/usr/share/games/thextech-aod/credits.txt"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm0755 "${srcdir}/TheXTech/build/output/bin/thextech" "${pkgdir}/usr/bin/thextech-aod"
    install -Dm0644 "${srcdir}/TheXTech/resources/icon/thextech_128.png" "${pkgdir}/usr/share/pixmaps/thextech-aod.png"
    install -Dm0755 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
