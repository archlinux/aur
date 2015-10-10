# Maintainer icasdri <icasdri at gmail dot com>
# Contributor: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Eric Belanger <eric at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Wesley Merkel <ooesili at gmail.com>

_pkgname=htop
pkgname=htop-solarized-vi
pkgver=649.e906c0d
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
        'vim-keybindings.patch')
sha256sums=('SKIP'            
            '787042745bab62731ec14734d0bc3ae18e11dbb87cfed189942887a58f2cd6a7'
            'f89f25cfd0430595e6a36f4e9c5677ff78dc63e93dc104a8a238a05a8f9e3ca9')

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

