# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=simple64
pkgver=2024.12.1
pkgrel=2
_cheat_parser_commit='33175b5fb977670e4f5c93fba4e2c9e406e92c16'
pkgdesc='Nintendo64 emulator based on Mupen64Plus'
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
provides=('m64p')
conflicts=('m64p' 'mupen64plus')
replaces=('m64p')
source=("git+https://github.com/simple64/simple64.git#tag=v${pkgver}"
        'simple64-cheat-parser'::"git+https://github.com/simple64/cheat-parser.git#commit=${_cheat_parser_commit}"
        '010-simple64-remove-bundled-discord-and-vosk.patch'
        '020-simple64-fix-paths.patch'
        'simple64.desktop')
sha256sums=('5e94d76ff8f506d147c90897bdd6e1a96caf9cc2dda01f97967c592aa2cef651'
            '03dbd6ac41407d13fe39bf8d8a3124c5de071eb591d2e9afffbae689375695d1'
            '6bc5bc2123ea4a69acebe18d2d33676f35b850d2011fc3f9e83078567ef2d9c9'
            '99436fff936a1b6994fec0c9dcf938625af7eaea80b20e44040577edc0996f26'
            'd7fa60ef8bfa7c8aff996a6a984c4d9fd5d8779681b6fb462e55919877558c98')

prepare() {
    icotool -x simple64/simple64-gui/icons/simple64.ico -o simple64/simple64-gui/icons
    patch -d simple64 -Np1 -i "${srcdir}/010-simple64-remove-bundled-discord-and-vosk.patch"
    patch -d simple64 -Np1 -i "${srcdir}/020-simple64-fix-paths.patch"
    rm -rf simple64/simple64-{gui/discord,input-qt/vosk}
    cp -af simple64-cheat-parser/cheats.json simple64
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
