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
pkgver=918.6d4df3d
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
    'ebc4339ff3d5d43606d9f5e398832cb9382bfa175b30e36cfbcaf6112206c33ea0d42e39246e3a73785d3f584cf88214'
    'cb75354484518f372da703a9a05a3856a527584c02b97706d25046995fa302fa55528bda1c6dc749cf6e4a25a3ed7fad'
    '353a675f5453b5b1ab503f9cbcb02e45b32bf429797f11e3cea96848fb4ad931129da7afa52b373fd6871c41657d52af'
    '3b2071d412a6a98bf5d4d3a4bc74f69b205f9464b00063aa21e9947b80df2a008bb82aff7f8168b0dfbac0647bc0cb76'
)


pkgver() {
    cd "${srcdir}/${_pkgname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
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

