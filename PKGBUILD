# Maintainer: Tarmo Heiskanen <turskii@gmail.com>
# Contributor: mar77i <mar77i at mar77i dot ch>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>

pkgname=st-scrollback-git
pkgver=0.7.24.g5a10aca
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X, patched with scrollback patches'
url='http://st.suckless.org/'
arch=('i686' 'x86_64')
license=('MIT')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
_patches=('http://st.suckless.org/patches/st-scrollback-20170329-149c0d3.diff'
          'http://st.suckless.org/patches/st-scrollback-mouse-20170427-5a10aca.diff'
          'http://st.suckless.org/patches/st-scrollback-mouse-altscreen-20170427-5a10aca.diff')
source=('git://git.suckless.org/st'
        ${_patches[@]})
sha1sums=('SKIP'
          '6a41683a04375f192d014cead227c749c595a721'
          '81b4a93c7bbf6854ec60630a5f7f50268a106a4b'
          'b181427a52dea0f1b5635cf51263a016d4d27cdf')
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
