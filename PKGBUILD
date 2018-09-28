# Maintainer: anyway <jb at abbadie.fr>
# Past Maintainer: mar77i <mar77i at mar77i dot ch>
# Past Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>

pkgname=st-anyway-git
_pkgname=st
pkgver=0.8.1.15.g30ec9a3
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X - solarized patch, inconsolata font, tmux compat'
url='http://st.suckless.org/'
arch=('i686' 'x86_64')
license=('MIT')
options=('zipman')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git')
epoch=1
# include config.h and any patches you want to have applied here
source=('git+https://git.suckless.org/st'
'https://st.suckless.org/patches/solarized/st-no_bold_colors-20170623-b331da5.diff'
'https://st.suckless.org/patches/solarized/st-solarized-dark-20180411-041912a.diff'
)
sha256sums=('SKIP'
            '71e1211189d9e11da93ee49388379c5f8469fcd3e1f48bb4d791ddaf161f5845'
            'b2d5e88a2616eafb82b2fefb63eecb0f9d71f839349ef40f9f69c1953444f88c')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
    cd "${_pkgname}"
    git describe --tags |sed 's/-/./g'
}

prepare() {
    local file
    cd "${_pkgname}"
    for file in "${source[@]}"; do
        if [[ "$file" == *.diff || "$file" == *.patch ]]; then
            echo $file
            # add all patches present in source array
            patch -Np1 <"$srcdir/$(basename ${file})"
        fi
    done

    sed \
        -e '/static char \*font/s/= .*/= "InconsolataGo Nerd Font Mono:size=11";/' \
        -e '/char \*worddelimiters/s/= .*/= " '"'"'`\\\"()[]{}<>|│";/' \
        -e 's/TERMMOD,              XK_Y,/ShiftMask,            XK_Insert,/' \
        -i config.def.h
    sed \
        -e 's/CPPFLAGS =/CPPFLAGS +=/g' \
        -e 's/CFLAGS =/CFLAGS +=/g' \
        -e 's/LDFLAGS =/LDFLAGS +=/g' \
        -e 's/_BSD_SOURCE/_DEFAULT_SOURCE/' \
        -i config.mk
    sed '/@tic/d' -i Makefile
}

build() {
    cd "${_pkgname}"
    make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
    cd "${_pkgname}"
    make PREFIX=/usr DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
