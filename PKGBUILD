# Maintainer icasdri <icasdri at gmail dot com>
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
pkgname=htop-vim-solarized-git
pkgver=2.0.2.r76.g65ec0bd
pkgrel=1
pkgdesc="Interactive process viewer with solarized and vim keybindings patch"
arch=('i686' 'x86_64')
url="https://github.com/hishamhm/${_pkgname}"
license=('GPL')
depends=('ncurses')
makedepends=('git' 'python2')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=(
    "git+${url}.git"
    'solarized-colors.patch'
    'vim-keybindings-common.patch'
    'vim-keybindings-d-for-kill.patch'
    'vim-keybindings-x-for-kill.patch'
)
sha384sums=(
    'SKIP'
    'd211726ddc557e54fb4682ee8d94b31b1a389b13db7cc398e6b1d4da554a812b1d5ce1371935142156d8fff19233e1d2'
    'a7c748693737a33ea2e36c21592179f55a625019d917716894771c3d495f85a8fdf88540497653e078eadd738f56533a'
    '353a675f5453b5b1ab503f9cbcb02e45b32bf429797f11e3cea96848fb4ad931129da7afa52b373fd6871c41657d52af'
    '3b2071d412a6a98bf5d4d3a4bc74f69b205f9464b00063aa21e9947b80df2a008bb82aff7f8168b0dfbac0647bc0cb76'
)


pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"

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
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}

