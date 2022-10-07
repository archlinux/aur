# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=simple64-git
pkgver=2022.10.3.r0.g34b6c06
pkgrel=1
pkgdesc='Nintendo64 emulator based on Mupen64Plus (git version)'
arch=('x86_64')
url='https://simple64.github.io/'
license=('GPL3')
depends=('discord-game-sdk' 'libpng' 'qt6-base' 'qt6-websockets' 'sdl2'
         'sdl2_net' 'vulkan-icd-loader' 'zlib' 'hicolor-icon-theme')
optdepends=('p7zip: for 7z/zip and VRU support'
            'vosk-api: for VRU support (voice recognition unit)')
makedepends=('git' 'cmake' 'ninja' 'imagemagick' 'zip' 'vosk-api')
provides=('simple64' 'm64p-git')
conflicts=('simple64' 'm64p-git' 'mupen64plus')
replaces=('m64p-git')
source=('git+https://github.com/simple64/simple64.git'
        '010-simple64-remove-bundled-discord-and-vosk.patch'
        '020-simple64-fix-paths.patch'
        'simple64.desktop')
sha256sums=('SKIP'
            '9676193fd290b7da7d8c2d5910099682e48f697f794245c28d9d274f290f93ed'
            'd524edcfe2e98f4bb8c443c19fdf8747752953cdf61ad62307c9105252b8f3c0'
            'acd624abe80b3399ef76c9f6ff45c5194ade6640a0fb18e43fd646c60345a883')

prepare() {
    patch -d simple64 -Np1 -i "${srcdir}/010-simple64-remove-bundled-discord-and-vosk.patch"
    patch -d simple64 -Np1 -i "${srcdir}/020-simple64-fix-paths.patch"
    rm -rf simple64/simple64-{gui/discord,input-qt/vosk}
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
    # gui
    local _size
    _size="$(magick identify -format '%wx%h' simple64/simple64-gui/icons/simple64.png)"
    install -D -m755 simple64/simple64/simple64-gui -t "${pkgdir}/usr/bin"
    install -D -m644 simple64.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 simple64/simple64-gui/icons/simple64.png -t "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    
    # mupen64plus
    install -D -m644 simple64/simple64/libmupen64plus.so -t "${pkgdir}/usr/lib"
    install -D -m644 simple64/simple64/simple64-{audio-sdl2,input-{qt,raphnetraw},{rsp,video}-parallel}.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 simple64/mupen64plus-core/src/api/m64p_*.h -t "${pkgdir}/usr/include/mupen64plus"
    install -D -m644 simple64/simple64/{font.ttf,mupen64plus.ini,mupencheat.txt} -t "${pkgdir}/usr/share/mupen64plus"
}
