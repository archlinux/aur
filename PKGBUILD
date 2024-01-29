# Maintainer: Felix Wiegand <koffeinflummi@gmail.com>

_pkgname=htop
pkgname=${_pkgname}-vim-git
pkgver=3.3.0.20.g32cb3027
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
            '81341dff8633e21a6dd92a3a1802e4ccca431234d8b65eff99ede5ce922ad5b8')

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

    ./autogen.sh

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-unicode \
        --enable-openvz \
        --enable-vserver

    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    make DESTDIR="$pkgdir" install
}
