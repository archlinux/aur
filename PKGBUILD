# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=m64p-git
pkgver=r104.g2938cb5
pkgrel=1
pkgdesc='Mupen64Plus with custom plugins and Qt5 GUI (git version)'
arch=('x86_64')
url='https://m64p.github.io/'
license=('GPL3')
depends=('freetype2' 'glu' 'hidapi' 'libpng' 'libsamplerate' 'minizip'
         'p7zip' 'qt5-base' 'sdl2' 'zlib')
makedepends=('git' 'cmake' 'nasm')
provides=('m64p' 'mupen64plus' 'mupen64plus-gui' 'mupenplus-video-gliden64')
conflicts=('m64p' 'mupen64plus' 'mupen64plus-gui' 'mupenplus-video-gliden64')
source=('git+https://github.com/loganmc10/m64p.git'
        'git+https://github.com/m64p/mupen64plus-gui.git'
        'git+https://github.com/m64p/mupen64plus-audio-sdl2.git'
        'git+https://github.com/mupen64plus/mupen64plus-rsp-hle.git'
        'git+https://github.com/m64p/mupen64plus-input-qt.git'
        'GLideN64-loganmc10'::'git+https://github.com/loganmc10/GLideN64.git'
        'mupen64plus-core-loganmc10'::'git+https://github.com/loganmc10/mupen64plus-core.git'
        'mupen64plus-input-raphnetraw-loganmc10'::'git+https://github.com/loganmc10/mupen64plus-input-raphnetraw.git'
        '001-m64p-git-remove-build-jobs-limitation.patch'
        '002-m64p-git-enable-optimizations.patch'
        'm64p.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '6871b495ace8a9005d93ce3e9103a15111a67793812dd5158072c981c4c3a5a8'
            'a999739626fc3e9d0102b65014c436bf4e9039587ccac174334672f3925f4495'
            'b884fc86180346226eb7e8bf8560d2b789318e810c9e26b6adbe7d8d047188df')

prepare() {
    git -C m64p submodule init
    git -C m64p config --local submodule.mupen64plus-core.url "${srcdir}/mupen64plus-core-loganmc10"
    git -C m64p config --local submodule.GLideN64.url         "${srcdir}/GLideN64-loganmc10"
    git -C m64p config --local submodule.mupen64plus-gui.url  "${srcdir}/mupen64plus-gui"
    git -C m64p config --local submodule.mupen64plus-audio-sdl2.url "${srcdir}/mupen64plus-audio-sdl2"
    git -C m64p config --local submodule.mupen64plus-rsp-hle.url    "${srcdir}/mupen64plus-rsp-hle"
    git -C m64p config --local submodule.mupen64plus-input-qt.url   "${srcdir}/mupen64plus-input-qt"
    git -C m64p config --local submodule.mupen64plus-input-raphnetraw.url "${srcdir}/mupen64plus-input-raphnetraw-loganmc10"
    git -C m64p submodule update
    patch -d m64p -Np1 -i "${srcdir}/001-m64p-git-remove-build-jobs-limitation.patch"
    patch -d m64p -Np1 -i "${srcdir}/002-m64p-git-enable-optimizations.patch"
}

pkgver() {
    printf 'r%s.g%s' "$(git -C m64p rev-list --count HEAD)" "$(git -C m64p rev-parse --short HEAD)"
}

build() {
    cd m64p
    ./build.sh
}

package() {
    # mupen64plus-gui
    install -D -m755 m64p/mupen64plus/mupen64plus-gui -t "${pkgdir}/usr/bin"
    install -D -m644 m64p.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 mupen64plus-gui/mupen64plus.ico "${pkgdir}/usr/share/pixmaps/m64p.ico"
    
    # mupen64plus components
    local _component
    for _component in core audio-sdl2 input-raphnetraw rsp-hle
    do
        make -C "m64p/mupen64plus-${_component}/projects/unix" DESTDIR="$pkgdir" PREFIX='/usr' LDCONFIG='true' install
    done
    local _sover
    _sover="$(find "${pkgdir}/usr/lib" -type f -name 'libmupen64plus.so.*.*.*' | sed 's/^.*\.so\.//')"
    ln -s "libmupen64plus.so.${_sover}" "${pkgdir}/usr/lib/libmupen64plus.so"
    
    # other plugins
    install -D -m644 m64p/mupen64plus/mupen64plus-input-qt.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 m64p/mupen64plus/mupen64plus-video-GLideN64.so -t "${pkgdir}/usr/lib/mupen64plus"
    install -D -m644 m64p/mupen64plus/GLideN64.custom.ini -t "${pkgdir}/usr/share/mupen64plus"
}
