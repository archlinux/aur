# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=simple64-git
pkgver=2022.09.2.r0.g830e68d
pkgrel=1
pkgdesc='Nintendo64 emulator based on Mupen64Plus (git version)'
arch=('x86_64')
url='https://simple64.github.io/'
license=('GPL3')
depends=('discord-game-sdk' 'libpng' 'qt6-base' 'qt6-websockets' 'sdl2'
         'sdl2_net' 'vulkan-icd-loader' 'zlib' 'hicolor-icon-theme')
optdepends=('p7zip: for 7z/zip and VRU support'
            'vosk-api: for VRU support (voice recognition unit)')
makedepends=('git' 'cmake' 'imagemagick' 'zip' 'vosk-api')
provides=('simple64' 'm64p-git')
conflicts=('simple64' 'm64p-git' 'mupen64plus')
replaces=('m64p-git')
source=('git+https://github.com/simple64/simple64.git'
        '010-simple64-remove-build-jobs-limitation.patch'
        '020-simple64-remove-bundled-discord-and-vosk.patch'
        '030-simple64-fix-paths.patch'
        '040-simple64-add-pie.patch'
        'simple64.desktop')
sha256sums=('SKIP'
            'bc93ed3b0cdea564302c3c1951ca313058ec1736f79472108aa4215cde74c047'
            'ebda5ebd0ec962df0006f112be5636b261d4ec912d71d1ce4b6eeb84f8b4382d'
            '8c9d03fb3ddb974400b54f291a0ec647118396f106db6cdc23d30f10f1baad64'
            'cbe0f5b43e8335092d574b5136dbc348d5fa74ac269773d93f5c1cfaba77952c'
            'acd624abe80b3399ef76c9f6ff45c5194ade6640a0fb18e43fd646c60345a883')

prepare() {
    patch -d simple64 -Np1 -i "${srcdir}/010-simple64-remove-build-jobs-limitation.patch"
    patch -d simple64 -Np1 -i "${srcdir}/020-simple64-remove-bundled-discord-and-vosk.patch"
    patch -d simple64 -Np1 -i "${srcdir}/030-simple64-fix-paths.patch"
    patch -d simple64 -Np1 -i "${srcdir}/040-simple64-add-pie.patch"
    rm -rf simple64/simple64-{gui/discord,input-qt/vosk}
}

pkgver() {
    git -C simple64 describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd simple64
    ./build.sh
}

package() {
    # gui
    local _size
    _size="$(magick identify -format '%wx%h' simple64/simple64-gui/icons/simple64.png)"
    install -D -m755 simple64/simple64/simple64-gui -t "${pkgdir}/usr/bin"
    install -D -m644 simple64.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 simple64/simple64-gui/icons/simple64.png -t "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    
    # mupen64plus components
    local _component
    local _sover
    local _vars='PREFIX=/usr LDCONFIG=true NO_ASM=1 NETPLAY=1 OSD=0'
    make -C simple64/mupen64plus-core/projects/unix DESTDIR="$pkgdir" ${_vars} install
    _sover="$(find "${pkgdir}/usr/lib" -type f -name 'libmupen64plus.so.*.*.*' | sed 's/^.*\.so\.//')"
    ln -s "libmupen64plus.so.${_sover}" "${pkgdir}/usr/lib/libmupen64plus.so"
    for _component in audio-sdl2 input-raphnetraw
    do
        make -C "simple64/simple64-${_component}/projects/unix" DESTDIR="$pkgdir" ${_vars} install
    done
    
    # other plugins
    install -D -m644 simple64/simple64/simple64-{input-qt,{rsp,video}-parallel}.so -t "${pkgdir}/usr/lib/mupen64plus"
}
