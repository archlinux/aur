# Maintainer: hexchain <i at hexchain dot org>

pkgname=tinc-pre
pkgver=1.1pre18
pkgrel=1
pkgdesc="VPN (Virtual Private Network) daemon (Pre-release)"
arch=(i686 x86_64 armv7h armv6h)
url="http://www.tinc-vpn.org/"
license=('GPL')
depends=('lzo' 'zlib' 'openssl' 'miniupnpc')
makedepends=('git' 'autoconf')
optdepends=('wxpython: gui support')
provides=('tinc-pre' 'tinc-pre-systemd')
conflicts=('tinc' 'tinc-pre-systemd')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gsliepen/tinc/archive/refs/tags/release-$pkgver.tar.gz"
        "tinc-1.1_pre18-fix-upnp.patch")
sha256sums=('bd2d010a1bdeb1dd767f6fbc769fce2a2169119fb3d177df928c27d1f20b5775'
            '3ab0064994f62a649f6736d732e5617deba5cb686e0159ecf8e42f773b1fb9b5')

build() {
    cd "$srcdir/tinc-release-$pkgver"

    patch -p1 < "../tinc-1.1_pre18-fix-upnp.patch"

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
