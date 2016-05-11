# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=routino-svn
pkgver=r1832
pkgrel=3
pkgdesc='Router for OpenStreetMap Data'
arch=('i386' 'x86_64')
url='http://www.routino.org/'
license=('AGPL3')
depends=('zlib' 'bzip2')
makedepends=('subversion')
conflicts=('routino')
provides=('routino')
source=("$pkgname::svn+http://routino.org/svn/trunk/")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"

    local ver="$(svnversion)"
    printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
    cd "$pkgname"

    sed -i 's|prefix=/usr/local|prefix=/usr|' Makefile.conf
}

build() {
    if echo $MAKEFLAGS | grep  -q -- '-j[2-9]'
    then
        error "Routino parallele compilation failed. Please unset -j make flag and relaunch the build."
        plain "$(gettext "Aborting...")"
        exit 1
    fi

    cd "$pkgname"

    make
}

package() {
    cd "$pkgname"

    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
