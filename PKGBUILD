# Maintainer: Kyle Keen <keenerd@gmail.com>

# uncomment whichever you want to build
pkgname=xombrero
#pkgname=xombrero-gtk2
pkgbase=xombrero
pkgver=1.6.4
pkgrel=2
pkgdesc="A minimalists web browser, vi-like but with traditional web browser behavior."
arch=('i686' 'x86_64')
url="https://opensource.conformal.com/wiki/xombrero"
_watch="https://opensource.conformal.com/snapshots/xombrero/"
license=('custom:ISC')
depends=('webkitgtk3' 'libbsd' 'desktop-file-utils')
if [[ "$pkgname" == "xombrero-gtk2" ]]; then
    depends=('webkitgtk2' 'libbsd' 'desktop-file-utils')
fi
install=$pkgbase.install
replaces=('xxxterm')
conflicts=('xxxterm')
options=('!emptydirs')
source=(https://opensource.conformal.com/snapshots/$pkgbase/$pkgbase-$pkgver.tgz \
        LICENSE)
md5sums=('3c5458e448314494f48784c6303a695c'
         'f3eeb6e8b70a3dcccb8ee57daf584c9e')

build() {
    cd "$srcdir/$pkgbase-$pkgver"
    # no spam
    sed -i 's|https://www.cyphertite.com|https://www.archlinux.org|' xombrero.{c,conf,h}
    # relocations
    sed -i 's|/etc/ssl/cert.pem|/etc/ssl/certs/ca-certificates.crt|' xombrero.conf
    #sed -i 's|/usr/local/share/xombrero/style.css|/usr/share/xombrero/style.css|' xombrero.conf
    sed -i 's|/usr/local/share/|/usr/share/|' {unix.c,xombrero.conf,xombrero.h}
    cd ..

    mkdir -p build-gtk{2,3}
    if [[ "$pkgname" == "xombrero-gtk2" ]]; then
        cp -R "$srcdir/$pkgbase-$pkgver" build-gtk2
        pushd "build-gtk2/$pkgbase-$pkgver"
        make PREFIX="/usr" -C linux GTK_VERSION=gtk2
        popd
    fi

    if [[ "$pkgname" == "xombrero" ]]; then
        cp -R "$srcdir/$pkgbase-$pkgver" build-gtk3
        pushd "build-gtk3/$pkgbase-$pkgver"
        make PREFIX="/usr" -C linux GTK_VERSION=gtk3
        popd
    fi
}

package() {
    if [[ "$pkgname" == "xombrero" ]]; then
        package_xombrero
    elif [[ "$pkgname" == "xombrero-gtk2" ]]; then
        package_xombrero-gtk2
    fi
}

package_xombrero() {
    depends=('webkitgtk3' 'libbsd' 'desktop-file-utils')
    conflicts=('xombrero-gtk2')

    cd "$srcdir/build-gtk3/$pkgbase-$pkgver"
    mkdir -p "$pkgdir/usr/share/applications/"  # buggy makefile
    make PREFIX="/usr" DESTDIR="$pkgdir" install -C linux GTK_VERSION=gtk3
    install -Dm644 xombrero.conf     "$pkgdir/etc/skel/.xombrero.conf"
    install -Dm644 xombrero.desktop  "$pkgdir/usr/share/applications/xombrero.desktop"
    install -Dm755 config-checker.pl "$pkgdir/usr/bin/config-checker.pl"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_xombrero-gtk2() {
    depends=('webkitgtk2' 'libbsd' 'desktop-file-utils')
    conflicts=('xxxterm' 'xombrero')

    cd "$srcdir/build-gtk2/$pkgbase-$pkgver"
    mkdir -p "$pkgdir/usr/share/applications/"  # buggy makefile
    make PREFIX="/usr" DESTDIR="$pkgdir" install -C linux GTK_VERSION=gtk2
    install -Dm644 xombrero.conf     "$pkgdir/etc/skel/.xombrero.conf"
    install -Dm644 xombrero.desktop  "$pkgdir/usr/share/applications/xombrero.desktop"
    install -Dm755 config-checker.pl "$pkgdir/usr/bin/config-checker.pl"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

