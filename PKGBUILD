# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=simple64
pkgver=2023.07.2
pkgrel=1
pkgdesc='Nintendo64 emulator based on Mupen64Plus'
arch=('x86_64')
url='https://simple64.github.io/'
license=('GPL3')
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
        '010-simple64-remove-bundled-discord-and-vosk.patch'
        '020-simple64-fix-paths.patch'
        'simple64.desktop')
sha256sums=('SKIP'
            '60ed1e91e78df8520454abf2eac1eef9efc2f6fcb62d1d9fb3eaa5d17734125f'
            '50be3722a8978f6e4c995898a7694b17de979f9d575ab746229dcd1468839b6b'
            'acd624abe80b3399ef76c9f6ff45c5194ade6640a0fb18e43fd646c60345a883')

prepare() {
    icotool -x simple64/simple64-gui/icons/simple64.ico -o simple64/simple64-gui/icons
    patch -d simple64 -Np1 -i "${srcdir}/010-simple64-remove-bundled-discord-and-vosk.patch"
    patch -d simple64 -Np1 -i "${srcdir}/020-simple64-fix-paths.patch"
    rm -rf simple64/simple64-{gui/discord,input-qt/vosk}
}

build() {
    cd simple64
    ./clean.sh
    ./build.sh
}

package() {
    # gui
    local _file
    local _res
    install -D -m755 simple64/simple64/simple64-gui -t "${pkgdir}/usr/bin"
    install -D -m644 simple64.desktop -t "${pkgdir}/usr/share/applications"
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/simple64.png"
    done < <(find simple64/simple64-gui/icons -maxdepth 1 -type f -name 'simple64_*_*x*x*.png' -print0)
    
    # mupen64plus
    install -D -m644 simple64/simple64/libmupen64plus.so -t "${pkgdir}/usr/lib"
    install -D -m644 simple64/simple64/simple64-{audio-sdl2,input-{qt,raphnetraw},{rsp,video}-parallel}.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 simple64/simple64/{font.ttf,mupen{64plus.ini,cheat.txt},pif.{ntsc,pal}.rom} -t "${pkgdir}/usr/share/mupen64plus"
    install -D -m644 simple64/mupen64plus-core/src/api/m64p_*.h -t "${pkgdir}/usr/include/mupen64plus"
}
