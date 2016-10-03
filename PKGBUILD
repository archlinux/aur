# Maintainer: Justus Piater <Justus-dev at Piater dot name>
pkgname=('syncevolution' 'syncevolution-http')
pkgver=1.5.1+20160926+SE+8fccc44+unclean+SYSYNC+59b55aa
pkgrel=1
pkgdesc="Synchronize PIM data via various protocols"
arch=('i686' 'x86_64')
url="https://syncevolution.org/"
license=('LGPL')
depends=('evolution-data-server' 'libgnome-keyring' 'neon' 'openobex' 'python2' 'libunique')
makedepends=('intltool' 'boost')
#changelog=
source=("http://downloads.syncevolution.org/syncevolution/sources/syncevolution-1.5.1%2B20160926%2BSE%2B8fccc44%2Bunclean%2BSYSYNC%2B59b55aa.tar.gz"
        "$pkgname-$pkgver-python2.patch")
sha256sums=('3563ebaf6b9a29c9a8baa6487554821480bcc6ff5b870af632a45ed92fe31d11'
            '8167ca6bb392ccb2f36093eef0e76d8c6cde5d43dcc595ad73af9af838ea14ce')

prepare() {
    cd "$pkgname-$pkgver"
    for patch in python2; do
      patch -p1 -i "$srcdir/$pkgname-$pkgver-$patch.patch"
    done
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
