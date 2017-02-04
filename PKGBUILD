# Maintainer: Tarmo Heiskanen <turskii@gmail.com>
# Contributor: mar77i <mar77i at mar77i dot ch>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>

pkgname=st-scrollback-git
pkgver=0.7.17.gc63a87c
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X, patched with scrollback patches'
url='http://st.suckless.org/'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
_patches=('http://st.suckless.org/patches/st-scrollback-20170104-c63a87c.diff'
          'http://st.suckless.org/patches/st-scrollback-mouse-20161020-6e79e83.diff'
          'http://st.suckless.org/patches/st-scrollback-mouse-altscreen-20161020-6e79e83.diff')
source=('git://git.suckless.org/st'
        ${_patches[@]})
sha1sums=('SKIP'
          'e256200eb049f99da7b7ea88db2242149dd206b8'
          '88b85b0f3dff3606c5c791ab5752fdfb36727c7c'
          'a891faa40d51641dc3f54d472cdcfa8fa83e6fc7')
provides=("st")
conflicts=("st")

pkgver() {
    cd "${srcdir}/st"

    git describe --tags |sed 's/-/./g'
}

prepare() {
    cd "${srcdir}/st"

    for patch in ${_patches[@]}; do
        echo "Applying patch ${patch##*/}..."
        git apply "${srcdir}/${patch##*/}"
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
