pkgname='texmaster'
pkgver='2009.3'
pkgrel='1'
pkgdesc='Texmaster is a tetris clone developed by Report.'
url='http://tetrisconcept.net/threads/texmaster.2/'
source=(
    'http://digitalno.de/public/tetris/texmaster/Texmaster2009-3.7z'
    'texmaster-launcher.c.in'
    'texmaster.install'
)
md5sums=('afe9c927d145829d3f6c8c47091f7be5'
         'fd1c7428af5fa94a0da404b3b9af7566'
         '1b5846f9cf3b7755c127ff465672eaeb')
arch=('i686' 'x86_64')
depends=('sdl' 'zlib')

package() {
    mkdir -p "$pkgdir/usr/local/games"
    cp -R "$srcdir/Texmaster2009-3" "$pkgdir/usr/local/games/"
    mkdir -p "$pkgdir/usr/bin"
    ln -s /usr/local/games/Texmaster2009-3/texmaster-launcher \
       "$pkgdir/usr/bin/texmaster"
}

build() {
    cd "$srcdir/Texmaster2009-3"
    gcc -o texmaster-launcher texmaster-launcher.c
}

prepare() {
    cd "$srcdir/Texmaster2009-3"
    case "$CARCH" in
        "i686") ARCHSUFFIX=i386;;
        "x86_64") ARCHSUFFIX=amd64;;
        *)
            echo "unknown arch $CARCH" >&2
            false;;
    esac
    gunzip Texmaster2009.ubuntu10.04.${ARCHSUFFIX}.gz
    chmod +x Texmaster2009.ubuntu10.04.${ARCHSUFFIX}
    cp Texmaster2009.ini Texmaster2009.ubuntu10.04.ini
    sed -i 's/^type = 0\r$/type = 1/' Texmaster2009.ubuntu10.04.ini
    sed "s/ARCHSUFFIX/${ARCHSUFFIX}/" ../../texmaster-launcher.c.in \
        >texmaster-launcher.c
}

install=texmaster.install
