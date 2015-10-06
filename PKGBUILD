# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=routino
pkgver=3.0
pkgrel=5
pkgdesc='Router for OpenStreetMap Data'
arch=('x86_64')
url='http://www.routino.org/'
license=('AGPL3')
depends=('zlib' 'bzip2')
makedepends=('make')
source=("http://www.routino.org/download/$pkgname-$pkgver.tgz")
sha256sums=('376512ef9627ce5c12e8c7a98dba7fe5125acfb89a9f9ee6758fbe36b5cf942f')

prepare() {
    cd "$pkgname-$pkgver"

    sed -i 's|prefix=/usr/local|prefix=/usr|' Makefile.conf
}

build() {
    if echo $MAKEFLAGS | grep  -q -- '-j[2-9]'
    then
        error "Routino parallele compilation failed. Please unset -j make flag and relaunch the build."
        plain "$(gettext "Aborting...")"
        exit 1
    fi

    cd "$pkgname-$pkgver"

    make
}

package() {
    cd "$pkgname-$pkgver"

    make DESTDIR="${pkgdir}" install
    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
