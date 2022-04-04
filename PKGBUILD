# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=m64p
pkgver=20220403
pkgrel=2
pkgdesc='Mupen64Plus with custom plugins and Qt5 GUI'
arch=('x86_64')
url='https://m64p.github.io/'
license=('GPL3')
depends=('freetype2' 'hidapi' 'libgl' 'libpng' 'libsamplerate' 'qt5-base'
         'qt5-websockets' 'sdl2' 'sdl2_net' 'vulkan-icd-loader' 'zlib'
         'discord-game-sdk' 'hicolor-icon-theme')
optdepends=('p7zip: for 7z/zip and VRU support'
            'vosk-api: for VRU support (voice recognition unit)')
makedepends=('git' 'cmake' 'nasm' 'python' 'zip' 'icoutils' 'vosk-api')
provides=('mupen64plus-gui')
conflicts=('mupen64plus-gui' 'mupen64plus')
_tag="v$(sed -E 's/^([0-9]{4})([0-9]{2})/\1.\2./' <<< "$pkgver")"
source=("git+https://github.com/loganmc10/m64p.git#tag=${_tag}"
        '010-m64p-remove-build-jobs-limitation.patch'
        '020-m64p-change-optimizations.patch'
        '030-m64p-remove-bundled-discord-and-vosk.patch'
        '040-m64p-fix-paths.patch'
        '050-m64p-add-pie.patch'
        'm64p.desktop')
sha256sums=('SKIP'
            'f6ae0125845fd8fc70efeae83fc54d6d4c0787f8215d274c84f259564ec36211'
            '1981ca0e45bd77faa0651336487be1899250b0d1f3c4191b84daa22ebc119918'
            'a32345c9013b2a6d8b08fd7aadb899643b95a7c4cee71cddbed1ae4fb7c8764b'
            '11f7a3caa150a716a12ab0d70a98089d7502d7a716f41e9bc419469fe4e1957a'
            '9d72588b07ef5e86c4730f9384b5d3622e38ccab0f99d7fa419870e7d19c264b'
            '8df4e8076d28a1bc44f41b0129a9935da9839e8a8cb9944206757e47da561808')

prepare() {
    icotool -x m64p/mupen64plus-gui/mupen64plus.ico -o m64p/mupen64plus-gui
    patch -d m64p -Np1 -i "${srcdir}/010-m64p-remove-build-jobs-limitation.patch"
    patch -d m64p -Np1 -i "${srcdir}/020-m64p-change-optimizations.patch"
    patch -d m64p -Np1 -i "${srcdir}/030-m64p-remove-bundled-discord-and-vosk.patch"
    patch -d m64p -Np1 -i "${srcdir}/040-m64p-fix-paths.patch"
    patch -d m64p -Np1 -i "${srcdir}/050-m64p-add-pie.patch"
    rm -rf m64p/mupen64plus-{gui/discord,input-qt/vosk}
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
        make -C "m64p/mupen64plus-${_component}/projects/unix" DESTDIR="$pkgdir" PREFIX='/usr' LDCONFIG='true' NEW_DYNAREC='0' NETPLAY='1' OSD='0' install
    done
    _sover="$(find "${pkgdir}/usr/lib" -type f -name 'libmupen64plus.so.*.*.*' | sed 's/^.*\.so\.//')"
    ln -s "libmupen64plus.so.${_sover}" "${pkgdir}/usr/lib/libmupen64plus.so"
    
    # other plugins
    install -D -m644 m64p/mupen64plus/mupen64plus-{input-qt,{rsp,video}-parallel}.so -t "${pkgdir}/usr/lib/mupen64plus"
}
