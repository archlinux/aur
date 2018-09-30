# Maintainer : Daniel Bermond < yahoo-com: danielbermond >

pkgname=mame-git
pkgver=0.202.r95.ge4d039bc077
pkgrel=1
pkgdesc='A port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support (git version)'
url='https://www.mamedev.org/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('sdl2_ttf' 'qt5-base' 'lua' 'libutf8proc' 'pugixml' 'portmidi' 'portaudio')
makedepends=('git' 'nasm' 'python' 'asio' 'rapidjson' 'glm' 'libxinerama')
provides=('mame')
conflicts=('mame')
source=("$pkgname"::'git+https://github.com/mamedev/mame.git'
        'mame.sh')
sha256sums=('SKIP'
            'aa90bae40c27a7732a0915b813a7f749ee2a0b95f6fc70128ff666498da58b5c')

prepare() {
    cd "$pkgname"
    
    # use system libraries
    sed -e 's|\# USE_SYSTEM_LIB|USE_SYSTEM_LIB|g' -i makefile
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^\(mame\)\([0-9]\)/\2./'
}

build() {
    cd "$pkgname"
    
    make \
        NOWERROR='1' \
        OPTIMIZE='2' \
        TOOLS='1' \
        ARCHOPTS='-flifetime-dse=1'
}

package() {
    cd "$pkgname"
    
    local _bin
    
    # mame script
    install -D -m755 "${srcdir}/mame.sh" "${pkgdir}/usr/bin/mame"
    
    # binaries
    [ "$CARCH" = 'i686'   ] && install -D -m755 mame32 "${pkgdir}/usr/lib/mame/mame"
    [ "$CARCH" = 'x86_64' ] && install -D -m755 mame64 "${pkgdir}/usr/lib/mame/mame"
    for _bin in castool chdman imgtool jedutil nltool nlwav pngcmp regrep romcmp src2html \
                split srcclean ldverify ldresample
    do
        install -D -m755 "$_bin" -t "${pkgdir}/usr/lib/mame"
    done
    
    # extra bits
    install -D -m644 src/osd/modules/opengl/shader/glsl*.*h -t "${pkgdir}/usr/lib/mame/shader/"
    cp -ar {artwork,bgfx,plugins,language,ctrlr,keymaps,hash}  "${pkgdir}/usr/lib/mame/"
    
    # documentation
    install -d -m0755 "${pkgdir}/usr/share/doc"
    cp -a docs "${pkgdir}/usr/share/doc/mame"
    rm -r "${pkgdir}/usr/share/doc/mame/man"
    install -d "$pkgdir"/usr/share/man/man{1,6}
    install -m644 docs/man/*.1* "${pkgdir}/usr/share/man/man1/"
    install -m644 docs/man/*.6* "${pkgdir}/usr/share/man/man6/"
}
