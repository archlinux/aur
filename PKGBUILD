# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=simple64
pkgver=2024.09.1
pkgrel=1
_cheat_parser_commit='92c86fcae60b3160f32dea69c674899fd83e1fc1'
pkgdesc='Nintendo64 emulator based on Mupen64Plus'
arch=('x86_64')
url='https://simple64.github.io/'
license=('GPL-3.0-only')
depends=('hidapi' 'libpng' 'qt6-base' 'qt6-websockets' 'sdl2' 'sdl2_net'
         'vulkan-icd-loader' 'zlib' 'hicolor-icon-theme')
optdepends=('discord-game-sdk: for Discord support'
            'p7zip: for 7z/zip and VRU support'
            'vosk-api: for VRU support (voice recognition unit)')
makedepends=('git' 'cmake' 'ninja' 'discord-game-sdk' 'icoutils' 'zip' 'vosk-api')
provides=('m64p')
conflicts=('m64p' 'mupen64plus')
replaces=('m64p')
source=("git+https://github.com/simple64/simple64.git#tag=v${pkgver}"
        'simple64-cheat-parser'::"git+https://github.com/simple64/cheat-parser.git#commit=${_cheat_parser_commit}"
        '010-simple64-remove-bundled-discord-and-vosk.patch'
        '020-simple64-fix-paths.patch'
        'simple64.desktop')
sha256sums=('27bdc055c85b6dbbbd930a19a62302985f0e78dfa52397a9e853411f70501245'
            '53f2c211dfabddbe7fc11c8f161882973495c2921ad1d47553b5b45b1687b3a4'
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
