# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgbase=mame-git
pkgname=('mame-git' 'mame-tools-git')
pkgver=0.230.r0.g943c06cba08
pkgrel=1
pkgdesc='Port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support (git version)'
url='https://www.mamedev.org/'
license=('GPL')
arch=('x86_64')
makedepends=('git' 'nasm' 'python' 'asio' 'rapidjson' 'glm' 'libxinerama' 'sdl2_ttf'
             'qt5-base' 'lua53' 'libutf8proc' 'pugixml' 'portmidi' 'portaudio' 'flac')
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
    git -C mame describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^\(mame\)\([0-9]\)/\2./'
}

build() {
    export CFLAGS+=' -I/usr/include/lua5.3'
    export CXXFLAGS+=' -I/usr/include/lua5.3'
    
    # hack to force linking to lua 5.3
    mkdir -p lib
    ln -s /usr/lib/liblua5.3.so lib/liblua.so
    export LDFLAGS+=" -L$(pwd)/lib"
    
    make -C mame \
        NOWERROR='1' \
        OPTIMIZE='2' \
        TOOLS='1' \
        ARCHOPTS='-flifetime-dse=1'
}

package_mame-git() {
    depends=('sdl2_ttf' 'qt5-base' 'lua53' 'libutf8proc' 'pugixml' 'portmidi' 'portaudio'
             'flac' 'hicolor-icon-theme')
    provides=('mame')
    conflicts=('mame')
    
    # mame script
    install -D -m755 mame.sh "${pkgdir}/usr/bin/mame"
    
    # binary
    install -D -m755 mame/mame -t "${pkgdir}/usr/lib/mame"
    
    # extra bits
    install -D -m644 mame/src/osd/modules/opengl/shader/glsl*.*h -t "${pkgdir}/usr/lib/mame/shader"
    cp -dr --no-preserve='ownership' mame/{artwork,bgfx,plugins,language,ctrlr,keymaps,hash} "${pkgdir}/usr/lib/mame"
    
    # desktop file and icon
    install -D -m644 mame.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 mame.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    
    # documentation
    install -d -m755 "${pkgdir}/usr/share/doc"
    install -D -m644 mame/docs/man/*.6* -t "${pkgdir}/usr/share/man/man6"
    cp -dr --no-preserve='ownership' mame/docs "${pkgdir}/usr/share/doc/mame"
    rm -r "${pkgdir}/usr/share/doc/mame/man"
}

package_mame-tools-git() {
    pkgdesc='Port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support (tools, git version)'
    depends=('sdl2' 'libutf8proc' 'flac')
    provides=('mame-tools')
    conflicts=('mame-tools')
    
    local _file
    for _file in castool chdman floptool imgtool jedutil ldresample ldverify nltool nlwav pngcmp regrep romcmp \
                 split srcclean testkeys unidasm
    do
        install -D -m755 "mame/${_file}" -t "${pkgdir}/usr/bin"
    done
    
    mv "${pkgdir}/usr/bin"/{,mame-}split # fix conflicts
    
    install -D -m644 mame/docs/man/*.1* -t "${pkgdir}/usr/share/man/man1"
}
