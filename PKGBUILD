# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=mupen64plus-gui-git
pkgver=r212.gcd0513f
pkgrel=1
pkgdesc='Mupen64Plus Graphical User Interface written in Qt5 (git version)'
arch=('x86_64')
url='https://github.com/m64p/mupen64plus-gui/'
license=('GPL3')
depends=('qt5-base' 'sdl2' 'p7zip' 'mupen64plus-git' 'libpng' 'zlib'
         'freetype2' 'libgl' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'icoutils')
provides=('mupen64plus-gui' 'mupenplus-video-gliden64')
conflicts=('mupen64plus-gui' 'mupenplus-video-gliden64' 'm64p')
source=('git+https://github.com/m64p/mupen64plus-gui.git'
        'git+https://github.com/m64p/mupen64plus-input-qt.git'
        'GLideN64-loganmc10'::'git+https://github.com/loganmc10/GLideN64.git#branch=NUI'
        'mupen64plus-core-loganmc10'::'git+https://github.com/loganmc10/mupen64plus-core.git#branch=m64p'
        'mupen64plus-gui.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '10aef6fadef59a92cbfd754ee6164b4c34cef43a4de230ef119757f7ea03eeb2')

prepare() {
    mkdir -p mupen64plus-{gui,input-qt}/build
    mkdir -p GLideN64-loganmc10/src/GLideNUI/build
    ln -s mupen64plus-core-loganmc10 mupen64plus-core
}

pkgver() {
    printf 'r%s.g%s' "$(git -C mupen64plus-gui rev-list --count HEAD)" "$(git -C mupen64plus-gui rev-parse --short HEAD)"
}

build() {
    printf '%s\n' '  -> Building GLideN64...'
    cd GLideN64-loganmc10/src
    ./getRevision.sh 2>/dev/null
    cd GLideNUI/build
    qmake-qt5 ../GLideNUI.pro
    make
    cd ../..
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DMUPENPLUSAPI:BOOL='ON' \
        -DUSE_SYSTEM_LIBS:BOOL='ON' \
        -Wno-dev
    make -C build
    
    printf '%s\n' '  -> Building mupen64plus-input-qt...'
    cd "${srcdir}/mupen64plus-input-qt/build"
    qmake-qt5 ../mupen64plus-input-qt.pro
    make
    
    printf '%s\n' '  -> Building mupen64plus-gui...'
    cd "${srcdir}/mupen64plus-gui/build"
    qmake-qt5 ../mupen64plus-gui.pro
    make
}

package() {
    # mupen64plus-gui
    install -D -m755 mupen64plus-gui/build/mupen64plus-gui -t "${pkgdir}/usr/bin"
    install -D -m644 mupen64plus-gui.desktop -t "${pkgdir}/usr/share/applications"
    icotool -x mupen64plus-gui/mupen64plus.ico
    local _count='1'
    local _depth
    local _file
    local _res
    while read -r -d '' _file
    do
        _depth="$(printf '%s' "$_file" | sed 's/\.png$//;s/^.*x//' )"
        _res="$(printf '%s' "$_file" | sed 's/\.png$//;s/^.*_//;s/x.*$//')"
        install -D -m644 "mupen64plus_${_count}_${_res}x${_res}x${_depth}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/mupen64plus.png"
        _count="$((_count + 1))"
    done < <(find -maxdepth 1 -type f -name 'mupen64plus_*_*x*x*.png' -print0 | sort -z)
    
    # needed plugins
    install -D -m644 mupen64plus-input-qt/build/libmupen64plus-input-qt.so "${pkgdir}/usr/lib/mupen64plus/mupen64plus-input-qt.so"
    install -D -m644 GLideN64-loganmc10/src/build/plugin/Release/mupen64plus-video-GLideN64.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 GLideN64-loganmc10/ini/GLideN64.custom.ini -t "${pkgdir}/usr/share/mupen64plus"
}
