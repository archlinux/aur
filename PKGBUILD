# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=m64p-git
pkgver=20220808.r0.gfa634d0
pkgrel=1
pkgdesc='Mupen64Plus with custom plugins and Qt6 GUI (git version)'
arch=('x86_64')
url='https://m64p.github.io/'
license=('GPL3')
depends=('discord-game-sdk' 'libpng' 'qt6-base' 'qt6-websockets' 'sdl2'
         'sdl2_net' 'vulkan-icd-loader' 'zlib' 'hicolor-icon-theme')
optdepends=('p7zip: for 7z/zip and VRU support'
            'vosk-api: for VRU support (voice recognition unit)')
makedepends=('git' 'cmake' 'zip' 'icoutils' 'vosk-api')
provides=('m64p' 'mupen64plus-gui')
conflicts=('m64p' 'mupen64plus-gui' 'mupen64plus')
source=('git+https://github.com/m64p/m64p.git'
        '010-m64p-remove-build-jobs-limitation.patch'
        '020-m64p-remove-bundled-discord-and-vosk.patch'
        '030-m64p-fix-paths.patch'
        '040-m64p-add-pie.patch'
        'm64p.desktop')
sha256sums=('SKIP'
            '53fa6d4b5449e5c06a384a12a4a2b38af510269e466db2d53ec7eb7b49d78bd3'
            'e9da860ae7adcdd0a1cc0155c232f81ca8399e9e855bd71fb51269edb708b1cc'
            'a483f645b0a2036485e90c3aeef2e1aa61724e4fbd1cd9a1f807a5aea47c595e'
            'a33a66612343035929eee5d6eb2acb342cc0c5a18a8e113aef83b28fb0f156c7'
            '8df4e8076d28a1bc44f41b0129a9935da9839e8a8cb9944206757e47da561808')

prepare() {
    icotool -x m64p/mupen64plus-gui/mupen64plus.ico -o m64p/mupen64plus-gui
    patch -d m64p -Np1 -i "${srcdir}/010-m64p-remove-build-jobs-limitation.patch"
    patch -d m64p -Np1 -i "${srcdir}/020-m64p-remove-bundled-discord-and-vosk.patch"
    patch -d m64p -Np1 -i "${srcdir}/030-m64p-fix-paths.patch"
    patch -d m64p -Np1 -i "${srcdir}/040-m64p-add-pie.patch"
    rm -rf m64p/mupen64plus-{gui/discord,input-qt/vosk}
}

pkgver() {
    local _tag
    _tag="$(git -C m64p describe --tags --abbrev='0')"
    printf '%s.r%s.%s' "$(git -C m64p log -1 --format='%ad' --date='format:%Y%m%d' "$_tag")" \
                       "$(git -C m64p describe --tags --long | awk -F'-' '{ print $2 }')" \
                       "$(git -C m64p describe --tags --long | awk -F'-' '{ print $3 }')"
}

build() {
    cd m64p
    ./build.sh
}

package() {
    # mupen64plus-gui
    local _file
    local _res
    install -D -m755 m64p/mupen64plus/mupen64plus-gui -t "${pkgdir}/usr/bin"
    install -D -m644 m64p.desktop -t "${pkgdir}/usr/share/applications"
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/mupen64plus.png"
    done < <(find m64p/mupen64plus-gui -maxdepth 1 -type f -name 'mupen64plus_*_*x*x*.png' -print0)
    
    # mupen64plus components
    local _component
    local _sover
    for _component in core audio-sdl2 input-raphnetraw
    do
        make -C "m64p/mupen64plus-${_component}/projects/unix" DESTDIR="$pkgdir" PREFIX='/usr' LDCONFIG='true' NO_ASM='1' NETPLAY='1' OSD='0' install
    done
    _sover="$(find "${pkgdir}/usr/lib" -type f -name 'libmupen64plus.so.*.*.*' | sed 's/^.*\.so\.//')"
    ln -s "libmupen64plus.so.${_sover}" "${pkgdir}/usr/lib/libmupen64plus.so"
    
    # other plugins
    install -D -m644 m64p/mupen64plus/mupen64plus-{input-qt,{rsp,video}-parallel}.so -t "${pkgdir}/usr/lib/mupen64plus"
}
