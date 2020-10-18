# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=m64p-git
pkgver=20201017.r1.g4033a04
pkgrel=1
pkgdesc='Mupen64Plus with custom plugins and Qt5 GUI (git version)'
arch=('x86_64')
url='https://m64p.github.io/'
license=('GPL3')
depends=('freetype2' 'hidapi' 'libgl' 'libpng' 'libsamplerate' 'minizip'
         'qt5-base' 'qt5-websockets' 'sdl2' 'sdl2_net' 'zlib' 'hicolor-icon-theme')
optdepends=('p7zip: for 7z/zip support')
makedepends=('git' 'cmake' 'nasm' 'icoutils')
provides=('m64p' 'mupen64plus-gui' 'mupen64plus-video-gliden64')
conflicts=('m64p' 'mupen64plus-gui' 'mupen64plus-video-gliden64' 'mupen64plus')
source=('git+https://github.com/loganmc10/m64p.git'
        '010-m64p-remove-build-jobs-limitation.patch'
        '020-m64p-enable-optimizations.patch'
        '030-m64p-fix-default-config-paths.patch'
        'm64p.desktop')
sha256sums=('SKIP'
            '28c95005fbfa3b30bcee412070c5fc13f74a2b6f52526a9ad733778de3aaec04'
            'd3834a29ccf06be9ad1c0a3039efb4ed69d81f61e814d1578a6bd19474aa11c3'
            'c3f932cfe90909bd2f69a352add4acdd4d67d1fb73559d651de3cec3acdc3737'
            '8df4e8076d28a1bc44f41b0129a9935da9839e8a8cb9944206757e47da561808')

prepare() {
    icotool -x m64p/mupen64plus-gui/mupen64plus.ico -o m64p/mupen64plus-gui
    patch -d m64p -Np1 -i "${srcdir}/010-m64p-remove-build-jobs-limitation.patch"
    patch -d m64p -Np1 -i "${srcdir}/020-m64p-enable-optimizations.patch"
    patch -d m64p -Np1 -i "${srcdir}/030-m64p-fix-default-config-paths.patch"
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
        _res="$(printf '%s' "$_file" | sed 's/\.png$//;s/^.*_//;s/x.*$//')"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/mupen64plus.png"
    done < <(find m64p/mupen64plus-gui -maxdepth 1 -type f -name 'mupen64plus_*_*x*x*.png' -print0)
    
    # mupen64plus components
    local _component
    local _sover
    for _component in core audio-sdl2 input-raphnetraw rsp-hle
    do
        make -C "m64p/mupen64plus-${_component}/projects/unix" DESTDIR="$pkgdir" PREFIX='/usr' LDCONFIG='true' OSD='0' install
    done
    _sover="$(find "${pkgdir}/usr/lib" -type f -name 'libmupen64plus.so.*.*.*' | sed 's/^.*\.so\.//')"
    ln -s "libmupen64plus.so.${_sover}" "${pkgdir}/usr/lib/libmupen64plus.so"
    
    # other plugins
    install -D -m644 m64p/mupen64plus/mupen64plus-input-qt.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 m64p/mupen64plus/mupen64plus-video-GLideN64.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 m64p/mupen64plus/GLideN64.custom.ini -t "${pkgdir}/usr/share/mupen64plus"
}
