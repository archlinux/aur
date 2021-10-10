# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=thextech-supermariobrosx
pkgver=1.3.5.2
pkgrel=1
pkgdesc="The full port of the SMBX engine from VB6 into C++ and SDL2, FreeImage and MixerX, with SMBX 1.3 game assets."
arch=('i386' 'x86_64' 'aarch64')
url="https://github.com/Wohlstand/TheXTech"
license=('GPL')
depends=('desktop-file-utils')
makedepends=('git' 'cmake' 'sdl2' 'libpng' 'libjpeg-turbo')
optdepends=()
provides=('thextech')
install=${pkgname}.install
source=("git://github.com/Wohlstand/TheXTech"
"http://wohlsoft.ru/projects/TheXTech/_downloads/thextech-smbx13-assets-full.7z"
"thextech-supermariobrosx.desktop")
sha256sums=("SKIP"
"73fbd497a60ce13525121a8d1a43ae3fd9205f6f4c64335787e06544d67cb4a9"
"9b2f13d4f9078eae7e5346c48ed7467536f22068dbfa941fe2c1daf00d78923d")
noextract=()

prepare() {
	cd "${srcdir}/TheXTech"
    git submodule init
    git submodule update
}

build() {
    env
	cd "${srcdir}/TheXTech"
	mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=MinSizeRel -DUSE_SYSTEM_SDL2=OFF -DUSE_SYSTEM_LIBS=OFF -DUSE_STATIC_LIBC=ON -DPGE_SHARED_SDLMIXER=OFF -DTHEXTECH_FIXED_ASSETS_PATH=/usr/share/games/thextech-smbx -DTHEXTECH_USER_DIR_NAME=.thextech-smbx ..
    CFLAGS="-march=native -mtune=generic -O2 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2  -fstack-clash-protection -fcf-protection" CXXFLAGS="-march=native -mtune=generic -O2 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -fstack-clash-protection -fcf-protection -Wp,-D_GLIBCXX_ASSERTIONS" make
}

package() {
    mkdir -p "${pkgdir}/usr/share/games/thextech-smbx"
    install -Dm0644 -r "${srcdir}/battle" "${pkgdir}/usr/share/games/thextech-smbx/battle"
    install -Dm0644 -r "${srcdir}/graphics" "${pkgdir}/usr/share/games/thextech-smbx/graphics"
    install -Dm0644 -r "${srcdir}/music" "${pkgdir}/usr/share/games/thextech-smbx/music"
    install -Dm0644 -r "${srcdir}/sound" "${pkgdir}/usr/share/games/thextech-smbx/sound"
    install -Dm0644 -r "${srcdir}/worlds" "${pkgdir}/usr/share/games/thextech-smbx/worlds"
    install -Dm0644 "${srcdir}/gameinfo.ini" "${pkgdir}/usr/share/games/thextech-smbx/gameinfo.ini"
    install -Dm0644 "${srcdir}/music.ini" "${pkgdir}/usr/share/games/thextech-smbx/music.ini"
    install -Dm0644 "${srcdir}/sounds.ini" "${pkgdir}/usr/share/games/thextech-smbx/sounds.ini"
    install -Dm0644 "${srcdir}/thextech.ini" "${pkgdir}/usr/share/games/thextech-smbx/thextech.ini"
    install -Dm0644 "${srcdir}/intro.lvl" "${pkgdir}/usr/share/games/thextech-smbx/intro.lvl"
    install -Dm0644 "${srcdir}/outro.lvl" "${pkgdir}/usr/share/games/thextech-smbx/outro.lvl"
    install -Dm0644 "${srcdir}/License.txt" "${pkgdir}/usr/share/games/thextech-smbx/License.txt"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm0755 "${srcdir}/TheXTech/build/output/bin/thextech" "${pkgdir}/usr/bin/thextech-smbx"
    install -Dm0644 "${srcdir}/TheXTech/resources/icon/thextech_128.png" "${pkgdir}/usr/share/pixmaps/thextech.png"
    install -Dm0644 "${srcdir}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm0755 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
