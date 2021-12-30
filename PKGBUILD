# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=m64p
pkgver=20211229
pkgrel=1
pkgdesc='Mupen64Plus with custom plugins and Qt5 GUI'
arch=('x86_64')
url='https://m64p.github.io/'
license=('GPL3')
depends=('freetype2' 'hidapi' 'libgl' 'libpng' 'libsamplerate' 'minizip'
         'qt5-base' 'qt5-websockets' 'sdl2' 'sdl2_net' 'vulkan-icd-loader'
         'zlib' 'hicolor-icon-theme')
optdepends=('p7zip: for 7z/zip support')
makedepends=('git' 'cmake' 'nasm' 'python' 'zip' 'icoutils')
provides=('mupen64plus-gui')
conflicts=('mupen64plus-gui' 'mupen64plus')
_tag="v$(sed -E 's/^([0-9]{4})([0-9]{2})/\1.\2./' <<< "$pkgver" |
         awk -F'.' 'OFS="." { for(N=2; N<=3; N++) sub(/^0/, "", $N); print }')"
source=("git+https://github.com/loganmc10/m64p.git#tag=${_tag}"
        '010-m64p-remove-build-jobs-limitation.patch'
        '020-m64p-change-optimizations.patch'
        '030-m64p-fix-paths.patch'
        '040-m64p-add-pie.patch'
        'm64p.desktop')
sha256sums=('SKIP'
            'b8882d2b3cce965bd03b100fc53419ff43d8934c364136bbe63473fca0692fec'
            'bd2964654f5c346af76a5408adc76d34bf490435c4400cfa1d2340f0ad598dcd'
            '782576ad8ff7c33f2d4dffb367509cd3590acdd357a17c432889a9f6f8b3d7a0'
            '5c604da87c9deb3582b43efa724589080a7070a108ab0c0d00e115cb35eb4b13'
            '8df4e8076d28a1bc44f41b0129a9935da9839e8a8cb9944206757e47da561808')

prepare() {
    icotool -x m64p/mupen64plus-gui/mupen64plus.ico -o m64p/mupen64plus-gui
    patch -d m64p -Np1 -i "${srcdir}/010-m64p-remove-build-jobs-limitation.patch"
    patch -d m64p -Np1 -i "${srcdir}/020-m64p-change-optimizations.patch"
    patch -d m64p -Np1 -i "${srcdir}/030-m64p-fix-paths.patch"
    patch -d m64p -Np1 -i "${srcdir}/040-m64p-add-pie.patch"
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
        make -C "m64p/mupen64plus-${_component}/projects/unix" DESTDIR="$pkgdir" PREFIX='/usr' LDCONFIG='true' NEW_DYNAREC='1' NETPLAY='1' OSD='0' install
    done
    _sover="$(find "${pkgdir}/usr/lib" -type f -name 'libmupen64plus.so.*.*.*' | sed 's/^.*\.so\.//')"
    ln -s "libmupen64plus.so.${_sover}" "${pkgdir}/usr/lib/libmupen64plus.so"
    
    # other plugins and components
    install -D -m644 m64p/mupen64plus/libdiscord_game_sdk.so -t "${pkgdir}/usr/lib"
    install -D -m644 m64p/mupen64plus-input-qt/vosk/libvosk.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 m64p/mupen64plus/mupen64plus-{input-qt,{rsp,video}-parallel}.so -t "${pkgdir}/usr/lib/mupen64plus"
}
