# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
pkgname=thextech-supermariobrosx
_pkgname=thextech-smbx
pkgver=v1.3.r2276.gb431ff31
pkgrel=2
pkgdesc="The full port of the SMBX engine from VB6 into C++ and SDL2, FreeImage and MixerX, with SMBX 1.3 game assets."
arch=('i386' 'x86_64' 'aarch64')
url="https://github.com/Wohlstand/TheXTech"
license=('GPLv3')
depends=('desktop-file-utils' 'sdl2' 'libjpeg-turbo' 'libpng' 'glew' 'libglvnd')
makedepends=('git' 'cmake' 'p7zip')
optdepends=()
provides=('thextech')
install=${pkgname}.install
source=("git+https://github.com/Wohlstand/TheXTech"
"assets.7z::https://wohlsoft.ru/projects/TheXTech/_downloads/thextech-smbx13-assets-full.7z"
"thextech-supermariobrosx.desktop")
noextract=("thextech-smbx13-assets-full.7z")
sha256sums=("SKIP"
"SKIP"
"f46693ed08b59d6beba12c324e5c2384a09b77b76c02dda22846ddca7e808043")
noextract=()

pkgver() {
    cd "${srcdir}/TheXTech"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/lastlocal.//'
}

prepare() {
	cd "${srcdir}/TheXTech"
    git submodule init
    git submodule update
}

build() {
    env
	cd "${srcdir}/TheXTech"
	if [ -d build ]; then rm -rf build; fi
	mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=MinSizeRel -DUSE_SYSTEM_LIBS=OFF -DUSE_STATIC_LIBC=ON -DPGE_SHARED_SDLMIXER=OFF -DUSE_FREEIMAGE_SYSTEM_LIBS=ON -DUSE_SYSTEM_SDL2=ON -DTHEXTECH_FIXED_ASSETS_PATH="/usr/share/games/${_pkgname}" -DTHEXTECH_USER_DIR_NAME=".${_pkgname}" ..
    CFLAGS="-march=native -mtune=generic -O2 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2  -fstack-clash-protection -fcf-protection" CXXFLAGS="-march=native -mtune=generic -O2 -pipe -fno-plt -fexceptions -Wp,-D_FORTIFY_SOURCE=2 -fstack-clash-protection -fcf-protection -Wp,-D_GLIBCXX_ASSERTIONS" make
}

package() {
    mkdir -p "${pkgdir}/usr/share/games/${_pkgname}"
    7z x "assets.7z" -o"${pkgdir}/usr/share/games/${_pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm0755 "${srcdir}/TheXTech/build/output/bin/thextech" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm0644 "${srcdir}/TheXTech/resources/icon/thextech_128.png" "${pkgdir}/usr/share/pixmaps/thextech.png"
    mkdir -p "${pkgdir}/usr/share/"{licenses,doc}"/${pkgname}"
    mv "${pkgdir}/usr/share/games/${_pkgname}/"*"."{odt,pdf} "${pkgdir}/usr/share/doc/${pkgname}/"
    mv "${pkgdir}/usr/share/games/${_pkgname}/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mkdir -p "${pkgdir}/usr/share/applications"
    install -Dm0755 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
