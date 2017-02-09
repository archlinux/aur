# $Id: PKGBUILD 186911 2016-08-17 17:41:49Z kkeen $
# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=xombrero
pkgver=1.6.4
_pkgver=1_6_4
pkgrel=5
pkgdesc="A minimalists web browser, vi-like but with traditional web browser behavior."
arch=('i686' 'x86_64')
url="https://github.com/conformal/xombrero"
license=('custom:ISC')
depends=('webkitgtk' 'libbsd' 'desktop-file-utils')
replaces=('xxxterm')
conflicts=('xxxterm')
options=('!emptydirs')
source=(https://github.com/conformal/xombrero/archive/XOMBRERO_${_pkgver}.tar.gz
        LICENSE)
md5sums=('a7c570f67b5791ec132bade643b508f7'
         'f3eeb6e8b70a3dcccb8ee57daf584c9e')

prepare() {
    cd "$srcdir/xombrero-XOMBRERO_$_pkgver"
    # no spam
    sed -i 's|https://www.cyphertite.com|https://www.archlinux.org|' xombrero.{c,conf,h}
    # relocations
    sed -i 's|/etc/ssl/cert.pem|/etc/ssl/certs/ca-certificates.crt|' xombrero.conf
    #sed -i 's|/usr/local/share/xombrero/style.css|/usr/share/xombrero/style.css|' xombrero.conf
    sed -i 's|/usr/local/share/|/usr/share/|' {unix.c,xombrero.conf,xombrero.h}
}

build() {
    cd "$srcdir/xombrero-XOMBRERO_$_pkgver"
    make PREFIX="/usr" -C linux GTK_VERSION=gtk3
}

package() {
    cd "$srcdir/xombrero-XOMBRERO_$_pkgver"

    mkdir -p "$pkgdir/usr/share/applications/"  # buggy makefile
    make PREFIX="/usr" DESTDIR="$pkgdir" install -C linux GTK_VERSION=gtk3
    install -Dm644 xombrero.conf     "$pkgdir/etc/skel/.xombrero.conf"
    install -Dm644 xombrero.desktop  "$pkgdir/usr/share/applications/xombrero.desktop"
    install -Dm755 config-checker.pl "$pkgdir/usr/bin/config-checker.pl"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

