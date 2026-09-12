# Maintainer: hexchain <i at hexchain dot org>

pkgname=tinc-pre
pkgver=1.1pre18
pkgrel=2
pkgdesc="VPN (Virtual Private Network) daemon (Pre-release)"
arch=(i686 x86_64 armv7h armv6h)
url="http://www.tinc-vpn.org/"
license=('GPL-2.0-or-later')
depends=('glibc' 'lzo' 'miniupnpc' 'ncurses' 'openssl' 'readline' 'zlib')
makedepends=('autoconf')
optdepends=('python-wxpython: gui support')
provides=('tinc-pre' 'tinc-pre-systemd')
conflicts=('tinc' 'tinc-pre-systemd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gsliepen/tinc/archive/refs/tags/release-$pkgver.tar.gz"
        "tinc-Handle-libminiupnpc-API-versions-between-17-and-21.patch")
sha256sums=('bd2d010a1bdeb1dd767f6fbc769fce2a2169119fb3d177df928c27d1f20b5775'
            '93d40a40d2cb87fd95d8e1e3b3c06ad3396f555e6cda72004f5ca982b4032efa')

build() {
    cd "$srcdir/tinc-release-$pkgver"

    patch -p1 < "../tinc-Handle-libminiupnpc-API-versions-between-17-and-21.patch"

    autoreconf -fsi
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-systemd=/usr/lib/systemd/system \
        --enable-miniupnpc
    make
}

package() {
    cd "$srcdir/tinc-release-$pkgver"
    make DESTDIR="$pkgdir" install

    mkdir -p "$pkgdir/etc/tinc/"
    mkdir -p "$pkgdir/usr/share/doc/tinc-pre/"
    cp -rv --no-preserve='ownership' "doc/sample-config/" "$pkgdir/usr/share/doc/tinc-pre/"
    install -Dm644 "bash_completion.d/tinc" -t "$pkgdir/usr/share/bash-completion/completions/"
}
