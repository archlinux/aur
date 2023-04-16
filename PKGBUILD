# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=simple64
pkgver=2023.04.11
pkgrel=1
pkgdesc='Nintendo64 emulator based on Mupen64Plus'
arch=('x86_64')
url='https://simple64.github.io/'
license=('GPL3')
depends=('discord-game-sdk' 'libpng' 'qt6-base' 'qt6-websockets' 'sdl2'
         'sdl2_net' 'vulkan-icd-loader' 'zlib' 'hicolor-icon-theme')
optdepends=('p7zip: for 7z/zip and VRU support'
            'vosk-api: for VRU support (voice recognition unit)')
makedepends=('git' 'cmake' 'ninja' 'icoutils' 'zip' 'vosk-api')
provides=('m64p')
conflicts=('m64p' 'mupen64plus')
replaces=('m64p')
source=("git+https://github.com/simple64/simple64.git#tag=v${pkgver}"
        '010-simple64-remove-bundled-discord-and-vosk.patch'
        '020-simple64-fix-paths.patch'
        'simple64.desktop')
sha256sums=('SKIP'
            'a23bca8650f7052a7177c2b5cf9c4266f7087df3e96e2fb8b0ed6c2de83d9cd2'
            '6da40b16d6b2ff795fea099b865dd080f0262b892737ce83f028fea561d641a3'
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
    install -D -m644 simple64/mupen64plus-core/src/api/m64p_*.h -t "${pkgdir}/usr/include/mupen64plus"
    install -D -m644 simple64/simple64/{font.ttf,mupen64plus.ini,mupencheat.txt} -t "${pkgdir}/usr/share/mupen64plus"
}
