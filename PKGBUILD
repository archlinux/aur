# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=simple64-git
pkgver=2024.12.1.r5.gd8c969c
pkgrel=1
pkgdesc='Nintendo64 emulator based on Mupen64Plus (git version)'
arch=('x86_64')
url='https://simple64.github.io/'
license=('GPL-3.0-only')
depends=(
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'hidapi'
    'libpng'
    'qt6-base'
    'qt6-websockets'
    'sdl2'
    'sdl2_net'
    'vulkan-icd-loader'
    'zlib')
optdepends=(
    '7zip: for 7z/zip and VRU support'
    'discord-game-sdk: for Discord support'
    'vosk-api: for VRU support (voice recognition unit)')
makedepends=(
    'cmake'
    'discord-game-sdk'
    'git'
    'icoutils'
    'ninja'
    'vosk-api'
    'vulkan-headers'
    'zip')
provides=('simple64' 'm64p-git')
conflicts=('simple64' 'm64p-git' 'mupen64plus')
replaces=('m64p-git')
source=('git+https://github.com/simple64/simple64.git'
        'simple64-cheat-parser'::'git+https://github.com/simple64/cheat-parser.git#commit=3b46bfc6cf12468d8766da3f2f46635111ff0505'
        '010-simple64-remove-bundled-discord-and-vosk.patch'
        '020-simple64-fix-paths.patch'
        'simple64.desktop')
sha256sums=('SKIP'
            'e01ff9369f637edb2c2b715a58cafc9ae7d8202d6c4f29edc3c35866250a3b8f'
            '6bc5bc2123ea4a69acebe18d2d33676f35b850d2011fc3f9e83078567ef2d9c9'
            '99436fff936a1b6994fec0c9dcf938625af7eaea80b20e44040577edc0996f26'
            'e188400b7de70ada7fbdec90f4bafbddd5f20f408fbb8ced1886508d9740e89f')

prepare() {
    icotool -x simple64/simple64-gui/icons/simple64.ico -o simple64/simple64-gui/icons
    patch -d simple64 -Np1 -i "${srcdir}/010-simple64-remove-bundled-discord-and-vosk.patch"
    patch -d simple64 -Np1 -i "${srcdir}/020-simple64-fix-paths.patch"
    rm -rf simple64/simple64-{gui/discord,input-qt/vosk}
    cp -af simple64-cheat-parser/cheats.json simple64
}

pkgver() {
    git -C simple64 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd simple64
    ./clean.sh
    ./build.sh
}

package() {
    install -D -m755 simple64/simple64/simple64-gui -t "${pkgdir}/usr/bin"
    install -D -m644 simple64.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 simple64/simple64-gui/icons/simple64.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    ln -s simple64.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/simple64-gui.svg"
    
    local _icon
    local _res
    while read -r -d '' _icon
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_icon")"
        install -D -m644 "$_icon" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/simple64.png"
        ln -s simple64.png "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/simple64-gui.png"
    done < <(find simple64/simple64-gui/icons -maxdepth 1 -type f -name 'simple64_*_*x*x*.png' -print0)
    
    install -D -m644 simple64/simple64/libmupen64plus.so -t "${pkgdir}/usr/lib"
    install -D -m644 simple64/simple64/simple64-{audio-sdl2,input-{qt,raphnetraw},{rsp,video}-parallel}.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 simple64/simple64/{cheats.json,mupen64plus.ini} -t "${pkgdir}/usr/share/mupen64plus"
    install -D -m644 simple64/mupen64plus-core/src/api/m64p_*.h -t "${pkgdir}/usr/include/mupen64plus"
}
