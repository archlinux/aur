# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=mame-git
pkgver=0.223.r0.gc55a261d26d
pkgrel=1
pkgdesc='A port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support (git version)'
url='https://www.mamedev.org/'
license=('GPL')
arch=('x86_64')
depends=('sdl2_ttf' 'qt5-base' 'lua53' 'libutf8proc' 'pugixml' 'portmidi' 'portaudio' 'flac')
makedepends=('git' 'nasm' 'python' 'asio' 'rapidjson' 'glm' 'libxinerama')
provides=('mame')
conflicts=('mame')
source=('git+https://github.com/mamedev/mame.git'
        'mame.sh'
        'mame.desktop'
        'mame.svg')
sha256sums=('SKIP'
            'ee1c59bafc5e5441e99fa4c58108a3e18048e60672f34de865c8a5a976094dba'
            '0e5e93f84673c2d17a1bf7a6b256cfa54ef89a086a828df19bc054c12776d821'
            '17c442c933d764175e4ce1de50a80c0c2ddd5d733caf09c3cd5e6ba697ac43f4')

prepare() {
    # use system libraries, except for asio
    sed -e 's|\# USE_SYSTEM_LIB|USE_SYSTEM_LIB|g' \
        -e 's|USE_SYSTEM_LIB_ASIO|\# USE_SYSTEM_LIB_ASIO|g' -i mame/makefile
}

pkgver() {
    cd mame
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^\(mame\)\([0-9]\)/\2./'
}

build() {
    export CFLAGS+=' -I/usr/include/lua5.3'
    export CXXFLAGS+=' -I/usr/include/lua5.3'
    
    # hack to force linking to lua 5.3
    mkdir lib
    ln -s /usr/lib/liblua5.3.so lib/liblua.so
    export LDFLAGS+=" -L$(pwd)/lib"
    
    make -C mame \
        NOWERROR='1' \
        OPTIMIZE='2' \
        TOOLS='1' \
        ARCHOPTS='-flifetime-dse=1'
}

package() {
    cd mame
    
    # mame script
    install -D -m755 "${srcdir}/mame.sh" "${pkgdir}/usr/bin/mame"
    
    # binaries
    install -D -m755 mame64 "${pkgdir}/usr/lib/mame/mame"
    local _bin
    for _bin in castool chdman floptool imgtool jedutil ldresample ldverify nltool \
                nlwav pngcmp regrep romcmp split srcclean testkeys unidasm
    do
        install -D -m755 "$_bin" -t   "${pkgdir}/usr/lib/mame"
        ln -s "/usr/lib/mame/${_bin}" "${pkgdir}/usr/bin/mame-${_bin}"
    done
    
    # extra bits
    install -D -m644 src/osd/modules/opengl/shader/glsl*.*h -t "${pkgdir}/usr/lib/mame/shader"
    cp -a {artwork,bgfx,plugins,language,ctrlr,keymaps,hash}   "${pkgdir}/usr/lib/mame"
    
    # desktop file and icon
    install -D -m644 "${srcdir}/mame.desktop" -t "${pkgdir}/usr/share/applications"
    install -D -m644 "${srcdir}/mame.svg"     -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    
    # documentation
    install -d -m0755 "${pkgdir}/usr/share/doc"
    cp -a docs "${pkgdir}/usr/share/doc/mame"
    rm -r "${pkgdir}/usr/share/doc/mame/man"
    install -d "$pkgdir"/usr/share/man/man{1,6}
    install -m644 docs/man/*.1* "${pkgdir}/usr/share/man/man1"
    install -m644 docs/man/*.6* "${pkgdir}/usr/share/man/man6"
}
