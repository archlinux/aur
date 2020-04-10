# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=m64p
pkgver=20200409
pkgrel=2
pkgdesc='Mupen64Plus with custom plugins and Qt5 GUI'
arch=('x86_64')
url='https://github.com/m64p/mupen64plus-gui/'
license=('GPL3')
depends=('freetype2' 'glu' 'hidapi' 'libpng' 'libsamplerate' 'minizip'
         'p7zip' 'qt5-base' 'sdl2' 'zlib')
makedepends=('git' 'cmake')
provides=('mupen64plus' 'mupen64plus-gui' 'mupenplus-video-gliden64')
conflicts=('mupen64plus' 'mupen64plus-gui' 'mupenplus-video-gliden64')
source=('git+https://github.com/loganmc10/m64p.git#tag=Apr92020'
        'git+https://github.com/m64p/mupen64plus-gui.git'
        'git+https://github.com/m64p/mupen64plus-audio-sdl2.git'
        'git+https://github.com/mupen64plus/mupen64plus-rsp-hle.git'
        'git+https://github.com/m64p/mupen64plus-input-qt.git'
        'GLideN64-loganmc10'::'git+https://github.com/loganmc10/GLideN64.git'
        'mupen64plus-core-loganmc10'::'git+https://github.com/loganmc10/mupen64plus-core.git'
        'mupen64plus-input-raphnetraw-loganmc10'::'git+https://github.com/loganmc10/mupen64plus-input-raphnetraw.git'
        'm64p.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'b884fc86180346226eb7e8bf8560d2b789318e810c9e26b6adbe7d8d047188df')

prepare() {
    cd m64p
    git submodule init
    git config --local submodule.mupen64plus-core.url "${srcdir}/mupen64plus-core-loganmc10"
    git config --local submodule.GLideN64.url         "${srcdir}/GLideN64-loganmc10"
    git config --local submodule.mupen64plus-gui.url  "${srcdir}/mupen64plus-gui"
    git config --local submodule.mupen64plus-audio-sdl2.url "${srcdir}/mupen64plus-audio-sdl2"
    git config --local submodule.mupen64plus-rsp-hle.url    "${srcdir}/mupen64plus-rsp-hle"
    git config --local submodule.mupen64plus-input-qt.url   "${srcdir}/mupen64plus-input-qt"
    git config --local submodule.mupen64plus-input-raphnetraw.url "${srcdir}/mupen64plus-input-raphnetraw-loganmc10"
    git submodule update
}

build() {
    cd m64p
    ./build.sh
}

package() {
    # mupen64plus-gui
    install -D -m755 m64p/mupen64plus/mupen64plus-gui -t "${pkgdir}/usr/bin"
    
    # mupen64plus-core
    local _sover
    _sover="$(find m64p/mupen64plus -type f -name 'libmupen64plus.so.*.*' | sed 's/^.*\.so\.//')"
    mkdir -p "${pkgdir}/usr/lib"
    cp -a m64p/mupen64plus/libmupen64plus.so* "${pkgdir}/usr/lib"
    ln -s "libmupen64plus.so.${_sover}" "${pkgdir}/usr/lib/libmupen64plus.so"
    
    # plugins
    install -D -m644 m64p/mupen64plus/mupen64plus-audio-sdl2.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 m64p/mupen64plus/mupen64plus-rsp-hle.so    -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 m64p/mupen64plus/mupen64plus-input-qt.so   -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 m64p/mupen64plus/mupen64plus-input-raphnetraw.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 m64p/mupen64plus/mupen64plus-video-GLideN64.so   -t "${pkgdir}/usr/lib/mupen64plus"
    
    # config
    install -D -m644 m64p/mupen64plus/font.ttf -t "${pkgdir}/usr/share/mupen64plus"
    install -D -m644 m64p/mupen64plus/GLideN64.custom.ini -t "${pkgdir}/usr/share/mupen64plus"
    install -D -m644 m64p/mupen64plus/mupen64plus.ini -t "${pkgdir}/usr/share/mupen64plus"
    install -D -m644 m64p/mupen64plus/mupencheat.txt  -t "${pkgdir}/usr/share/mupen64plus"
    
    # desktop and icon
    install -D -m644 m64p.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 mupen64plus-gui/mupen64plus.ico "${pkgdir}/usr/share/pixmaps/m64p.ico"
}
