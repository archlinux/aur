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
pkgver=845.306c544
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
source=("git+${url}.git"
        'solarized-colors.patch'
        'vim-keybindings-common.patch'
        )
sha384sums=('SKIP'
            'ebc4339ff3d5d43606d9f5e398832cb9382bfa175b30e36cfbcaf6112206c33ea0d42e39246e3a73785d3f584cf88214'
            'ed66bbb01099872d740dae21da6c1bea76e150b66fd64e1d6771aef24fa16fb0dd95a4d4144ecde8d867da1b25a7ce24'
            )


# See the kill_process_shortcut option at the top of this PKGBUILD
if [[ "$kill_process_shortcut" == "d" ]]
then
    msg2 "Using '$kill_process_shortcut' as the kill-process shortcut in htop"
    source+=('vim-keybindings-d-for-kill.patch')
    sha384sums+=('4129c5563a287e2eaeeffca7d508309ac1dbc69d2fc3b00eb47b8450ae8acc35126cd78b2d268a491103463f6507b2a6')
else  # default to $kill_process_shortcut = x
    msg2 "Using 'x' as the kill-process shortcut in htop"
    source+=('vim-keybindings-x-for-kill.patch')
    sha384sums+=('9817d55acfc4535c58a3b1c92e43cc752830121c69ae6d0cb088fd7074d8cecbad488dc7b84bae4d7c284b30c6989974')
fi

pkgver() {
    cd "${srcdir}/${_pkgname}"
    local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "%s" "${ver//-/.}"
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    for _p in "${source[@]}"
    do
        if [[ "$_p" == *.patch ]]
        then
            msg2 "Applying $_p"
            patch -p1 -i "../$_p"
        fi
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

