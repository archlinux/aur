# Maintainer: Guillaume Hayot <ghayot@postblue.info>
pkgname=emulationstation
_gitname=EmulationStation
pkgver=2.9.1
pkgrel=2
pkgdesc="Emulation Station is a flexible emulator front-end supporting keyboardless navigation and custom system themes."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/RetroPie/EmulationStation"
license=('MIT')
install=emulationstation.install
depends=('vlc' 'alsa-lib' 'sdl2' 'boost-libs' 'freeimage' 'curl' 'libraw' 'libcec' 'rapidjson')
makedepends=('cmake' 'boost' 'freetype2' 'eigen' 'curl' 'git')
optdepends=('ttf-droid: Fallback fonts for Chinese/Japanese/Korean characters'
            'dolphin-emu: GameCube and Wii support'
            'mupen64plus: Nintendo 64 support'
            'mednafen: NES and GBA support'
            'zsnes: SNES support'
            'stella: Atari 2600 support'
            'ppsspp-headless: PSP support'
            'steam: Steam support')
conflicts=(emulationstation-git)
source=("https://github.com/RetroPie/$_gitname/archive/v$pkgver.tar.gz"
        "https://patch-diff.githubusercontent.com/raw/RetroPie/$_gitname/pull/618.patch"
        "stringfix.patch"
        "emulationstation.desktop"
        "emulationstation.png")
sha256sums=('549510df984a368ddc924d938a73c89ea1ae2af070d11666496972d4e79709d5'
            '3c13d66479d4f900e65a53232034943fe44a9861e5fefec1cfd8bbd69dde20c3'
            '4035702c4fc08491774069896d3e397b7c4a61e77b4b35063ab0a766c2e9fdb8'
            '5564803e0a82e132ab507b9cd341b32d1ce5b8be527996fbe13607d90f1dde2c'
            'ac589d9da5c258226f8de76e99afe2b07ac86030ced90d284d31b51193057f9c')

prepare() {
        rm -rf "${_gitname}-${pkgver}/external/pugixml"
        git clone https://github.com/zeux/pugixml.git "${_gitname}-${pkgver}/external/pugixml"
        patch -d "${_gitname}-${pkgver}" -Np1 -i "${srcdir}/618.patch"
        patch -d "${_gitname}-${pkgver}" -Np1 -i "${srcdir}/stringfix.patch"
}

build() {
    cmake -B "${_gitname}-${pkgver}/build" \
        -S "${_gitname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev -Wno-deprecated \
    ..
    make -C "${_gitname}-${pkgver}/build" all
}

package() {
    make -C "${_gitname}-${pkgver}/build" DESTDIR="${pkgdir}" install
}
