# Maintainer: Felix Wiegand <koffeinflummi@gmail.com>

_pkgname=htop
pkgname=${_pkgname}-vim-git
pkgver=3.2.2.11.g37eddcf5
pkgrel=1
epoch=1
pkgdesc="Interactive text-mode process viewer. Patched for vim keybindings"
url="https://github.com/htop-dev/${_pkgname}"
license=('GPL')
arch=('i686' 'x86_64' 'armv7h')
depends=('ncurses' 'libncursesw.so' 'libnl')
makedepends=('git')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop' 'htop-git')
options=('!emptydirs')
source=("git+${url}.git"
        'vim-keybindings.patch')
sha256sums=('SKIP'
            '685e3cdf5e0b36d498d752afefa5540a3d92e03c0b9219a21230fa91e6c4ad3a')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    local ver="$(git describe --tags)"
    printf "%s" "${ver//-/.}"
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    for _p in ${srcdir}/*.patch
    do
        msg2 "Applying $_p"
        patch -p1 -i $_p
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
    make -C "${srcdir}/${_pkgname}" DESTDIR="$pkgdir" install
}
