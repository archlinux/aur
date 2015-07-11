# Contributor: Chia-Wei Li <dreamcwli@gmail.com>

pkgname=pcmanx-gtk2-git
pkgver=20130709
pkgrel=1
pkgdesc="A gtk+ based free BBS client"
url="http://code.google.com/p/pcmanx-gtk2"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2' 'librsvg')
makedepends=('autoconf' 'automake' 'git' 'intltool')
options=('!libtool')
provides=('pcmanx-gtk2')
conflicts=('pcmanx-gtk2')

_gitroot="https://code.google.com/p/pcmanx-gtk2/"
_gitname="pcmanx-gtk2"

build() {
    cd ${srcdir}

    if [ -d $_gitname ]; then
        (cd $_gitname && git pull origin)
    else
        git clone $_gitroot $_gitname
        cd $_gitname
    fi

    msg "Git checkout done or server timeout"
    msg "Starting make..."

    ./autogen.sh
    ./configure --prefix=/usr --enable-iplookup || return 1
    make || return 1
}

package() {
    make DESTDIR=${pkgdir} install || return 1
}

post_upgrade() {
    echo "To enable IP location lookup, you need to download"
    echo "qqwry.dat (from eg. http://www.cz88.net/fox/) and"
    echo "install it as ~/.pcmanx/qqwry.dat (case sensitive)."
}
