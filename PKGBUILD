# Maintainer: Ferdinand B <theferdi265@gmail.com>
#  forked from aur/vlock-original
# Maintainer: Hexchain Tong <i@hexchain.org>
# Maintainer: Chris Down <chris@chrisdown.name>
# Contributor: Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vlock-original-noroot
pkgver=2.2.3
pkgrel=3
pkgdesc="A small console locking program"
url="http://cthulhu.c3d2.de/~toidinamai/vlock/vlock.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('pam')
makedepends=('git')
install=$pkgname.install
source=("git+git://repo.or.cz/vlock.git#tag=vlock-${pkgver}")
md5sums=('SKIP')

build() {
    cd "$srcdir/vlock"
    ./configure --prefix=/usr --sbindir=/usr/bin --disable-root-password
    make
}

package() {
    cd "$srcdir/vlock"
    make DESTDIR="$pkgdir" VLOCK_GROUP=129 install

    rm -rf "${pkgdir}/usr/sbin/"

    find "$pkgdir" -type f -name 'vlock*' -exec sh -c '
    dir=${0%/*}
    file=${0##*/}

    mv "$0" "$dir/${file/vlock/vlock-original}"' {} \;
    sed -i 's/vlock-main/vlock-original-main/' "$pkgdir"/usr/bin/vlock-original
}
