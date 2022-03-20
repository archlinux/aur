pkgname='texmaster'
pkgver='2009.3'
pkgrel='8'
pkgdesc='Texmaster is a tetris clone developed by Report.'
url='https://tetrisconcept.net/threads/texmaster.2/'
source=(
    'https://tetrisconcept.tv/info/Texmaster2009-3.zip'
    'texmaster-launcher.c.in'
    'texmaster.install'
)
md5sums=('25fdd2e90fc6186ad0f0d962a0769d07'
         '2cc37514846c4bdfc8d9d3320ed78353'
         '2cc3ce9cbfe611ee49440a0b0590d90f')
arch=('x86_64')
license=('unknown')
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
