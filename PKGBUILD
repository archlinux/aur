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
pkgver=649.e906c0d
pkgrel=3
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
sha256sums=('SKIP'
            '787042745bab62731ec14734d0bc3ae18e11dbb87cfed189942887a58f2cd6a7'
            'c9cce4293820e8b61f27d70244fdf6c87633f3eab4169b9818c2130ed3d3a798'
            )


# See the kill_process_shortcut option at the top of this PKGBUILD
if [[ "$kill_process_shortcut" == "d" ]]
then
    msg2 "Using '$kill_process_shortcut' as the kill-process shortcut in htop"
    source+=('vim-keybindings-d-for-kill.patch')
    sha256sums+=('b583caaab3fff1f28bd358f966ad33187a8f9bed607fec08607a030219db70d9')
else  # default to $kill_process_shortcut = x
    msg2 "Using 'x' as the kill-process shortcut in htop"
    source+=('vim-keybindings-x-for-kill.patch')
    sha256sums+=('dfdcd296508e725572f475308182d9a5d1a4cf7ae8c464f33b9907d92e243a09')
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

