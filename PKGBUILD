# Maintainer: Justus Piater <Justus-dev at Piater dot name>
pkgname=('syncevolution' 'syncevolution-http')
pkgver=1.5.3
pkgrel=1
pkgdesc="Synchronize PIM data via various protocols"
arch=('x86_64')
url="https://syncevolution.org/"
license=('LGPL')
depends=('evolution-data-server' 'libgnome-keyring' 'neon' 'openobex' 'python2' 'libunique')
makedepends=('intltool' 'boost' 'python')
#changelog=
source=("https://download.01.org/syncevolution/syncevolution/sources/syncevolution-$pkgver.tar.gz"
        "$pkgname-$pkgver-sslcert.patch"
        "$pkgname-$pkgver-python2.patch")
sha256sums=('e1195fda09bc7782eb8a55674e9e69d69da4780a9aa4a54d37d84da67ee863c0'
            '6904cd9eb9ed4e3eb888bad187315960de9d8a23d69c3c5587e011441cca1494'
            '704cbbf11289c5fd82b8c7228661f8cddaa40714598c56b2154783a35630128e')

prepare() {
    cd "$pkgname-$pkgver"
    for patch in sslcert python2; do
      patch -p1 -i "$srcdir/$pkgname-$pkgver-$patch.patch"
    done
    autoreconf -fiv
    cd src/synthesis
    autoreconf -fiv
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr                        \
                --libexecdir=/usr/lib/syncevolution  \
                --sysconfdir=/etc                    \
                --enable-bluetooth                   \
                --enable-core                        \
                --enable-dbus-service                \
                --enable-notify                      \
                --enable-notify-compatibility        \
                --enable-gui                         \
                --enable-pbap                        \
                --enable-dav
    make
}

package_syncevolution() {
    cd "$pkgbase-$pkgver"
    make DESTDIR="$pkgdir/" install
    rm -df "$pkgdir/usr/bin/syncevo-http-server" \
           "$pkgdir/usr/lib/syncevolution/test"
}

package_syncevolution-http() {
    pkgdesc="Synchronize PIM data via various protocols (HTTP server)"
    arch=('any')
    depends=('syncevolution'
             'python2-dbus'
             'python2-twisted'
             'python2-gobject2'
             'python2-pyopenssl'
             'python2-service-identity')
    #changelog=

    /usr/bin/install -D "$pkgbase-$pkgver/test/syncevo-http-server.py" \
                        "$pkgdir/usr/bin/syncevo-http-server"
}
