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
pkgver=2.2.0.r15.g67e3689
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
    '33b6f8247d6784b73f63870b44340cf0f765d22dd3ce5306718a2698dccdb171a3bb905fe87b966a598e3b4c0730d241'
    '4e4d5d81372c3a4b007856664110319d0f8c89c2e8434628f89d833a8f1cc54650797c2e852eb9d50ad3e695f2bba93f'
    'bf255f46456fe13992667f25216045dfd382469c9ae69e57071761c1e8dc9158c05d5c569b8b2e1f365d7b4eb6f3f307'
    'c137cae3ec83fe2a0d379b83010d6092423dedc69676448a7b6d7fd815ffe3048848a5b7669920e5020bd96063c14466'
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

