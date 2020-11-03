# Maintainer icasdri <icasdri at gmail dot com>
# Contributor: Yardena Cohen <yardenack at gmail dot com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Eric Belanger <eric at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Wesley Merkel <ooesili at gmail.com>
# Contributor: Hekuran Gashi <hekurangashi at protonmail dot com>

_pkgname=htop
pkgname=htop-vim-solarized-git
pkgver=3.0.2.r226.g0806a79
pkgrel=1
pkgdesc="Interactive process viewer with solarized and vim keybindings patch"
arch=('i686' 'x86_64')
url='https://github.com/htop-dev/htop'
license=('GPL')
depends=('ncurses' 'libncursesw.so' 'libnl')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
options=('!emptydirs')
provides=('htop')
conflicts=('htop')
source=(
    "git+${url}.git"
    'solarized-colors.patch'
    'vim-keybindings.patch'
)
sha384sums=(
    'SKIP'
    '33b6f8247d6784b73f63870b44340cf0f765d22dd3ce5306718a2698dccdb171a3bb905fe87b966a598e3b4c0730d241'
    '38b6e858f23f74d18fa0ae042f9ca197de24aa3b3ab9f5d51048ac42d2d0208a7c9e62b32e1423c29de7035f6ddecf08'
)



pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    for _p in "${source[@]:1}"
    do
        msg2 "Applying $_p"
        patch -p1 -i "../$_p"
    done

    autoreconf -fi
}

build() {
    cd "${srcdir}/${_pkgname}"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-cgroup \
        --enable-delayacct \
        --enable-openvz \
        --enable-unicode \
        --enable-vserver

    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="${pkgdir}" install
}

