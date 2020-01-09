# Maintainer: Tarmo Heiskanen <turskii@gmail.com>
# Contributor: mar77i <mar77i at mar77i dot ch>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>

pkgname=st-scrollback-git
pkgver=0.8.2.r25.g3848301
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X, patched with scrollback patches'
url='https://st.suckless.org/'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
_patches=('https://st.suckless.org/patches/scrollback/st-scrollback-20190331-21367a0.diff'
          'https://st.suckless.org/patches/scrollback/st-scrollback-mouse-20191024-a2c479c.diff'
          'https://st.suckless.org/patches/scrollback/st-scrollback-mouse-altscreen-20191024-a2c479c.diff')
source=('git://git.suckless.org/st'
        ${_patches[@]})
sha1sums=('SKIP'
        'fc5140eb0cc74636e5a0f5cd629e3cfbd10c9ed7'
        'e457b4819f5233999e21d6df8438931160cd9181'
        '0648ea793dbb9e7e6ab8b3c841c25ab39a001eb0')
provides=("st")
conflicts=("st")


pkgver() {
    cd "${srcdir}/st"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/st"

    for patch in ${_patches[@]}; do
        echo "Applying patch ${patch##*/}..."
        git apply -v "${srcdir}/${patch##*/}"
    done

    echo 'Copying config.def.h to $startdir...'
    cp config.def.h "${startdir}/"

    echo 'Copying config.h from $startdir if it exists...'
    [ -f "${startdir}/config.h" ] && cp "${startdir}/config.h" . || true
}

build() {
    cd "${srcdir}/st"

    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd "${srcdir}/st"

    make PREFIX=/usr DESTDIR="${pkgdir}" TERMINFO="/dev/null" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
