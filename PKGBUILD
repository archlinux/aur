# Maintainer Connor Prussin <connor at prussin dot net>
# Contributor: icasdri <icasdri at gmail dot com>
# Contributor: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Eric Belanger <eric at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Wesley Merkel <ooesili at gmail.com>

##### OPTIONS ###############################################################

# Set the following variable accordingly:
#    * x if you would like to use x as the kill-process shortcut in htop
#    * d if you would like to use d as the kill-process shortcut in htop
# (we need one of these as htop's default shortcut k conflicts with vim
#  movement keys!)

kill_process_shortcut=x
#kill_process_shortcut=d

#############################################################################

_pkgname=htop
pkgname=htop-vim-solarized
pkgver=2.2.0
pkgrel=1
pkgdesc="Interactive process viewer with solarized and vim keybindings patch"
arch=('i686' 'x86_64')
url="https://github.com/cprussin/htop-vim-solarized"
license=('GPL')
depends=('ncurses')
makedepends=('git' 'python2')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=(
    "http://hisham.hm/htop/releases/${pkgver}/htop-${pkgver}.tar.gz"
    'solarized-colors.patch'
    'vim-keybindings-common.patch'
    'vim-keybindings-d-for-kill.patch'
    'vim-keybindings-x-for-kill.patch'
)
sha384sums=('1db22d35dbd27753b7988f324c841b8c57db29957d2634c345f11b7be6f68ffef47b8f45ebfac160e94964e91f8ddf8d'
            '3ffcf99a5d8ff9816340fd591859d3e5a1b710ad7f6e6ab5581a0d11573df1991533191366b86a0e6dfa80f8d4617020'
            '3de0c03296baa0089380a3404a13e96b347b6caaf18380dacd6b5f9c81f3741940bdcd1f07f75bd13e05112e333d2635'
            '353a675f5453b5b1ab503f9cbcb02e45b32bf429797f11e3cea96848fb4ad931129da7afa52b373fd6871c41657d52af'
            '3b2071d412a6a98bf5d4d3a4bc74f69b205f9464b00063aa21e9947b80df2a008bb82aff7f8168b0dfbac0647bc0cb76')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    patch_list=(
        'solarized-colors.patch'
        'vim-keybindings-common.patch'
        "vim-keybindings-${kill_process_shortcut}-for-kill.patch"
    )

    msg2 "Using '$kill_process_shortcut' as the kill-process shortcut in htop"

    for _p in "${patch_list[@]}"
    do
        msg2 "Applying $_p"
        patch -p1 -i "../$_p"
    done

    ./autogen.sh

    sed -i 's|ncursesw/curses.h|curses.h|' RichString.[ch] configure
    sed -i 's|python|python2|' scripts/MakeHeader.py

    ./configure \
        --prefix=/usr \
        --enable-unicode \
        --enable-openvz \
        --enable-vserver \
        --enable-cgroup \
        --enable-oom
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
