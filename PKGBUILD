# Maintainer: Justus Piater <Justus-dev at Piater dot name>
pkgname=('syncevolution' 'syncevolution-http')
pkgver=1.5.2
pkgrel=2
pkgdesc="Synchronize PIM data via various protocols"
arch=('i686' 'x86_64')
url="https://syncevolution.org/"
license=('LGPL')
depends=('evolution-data-server' 'libgnome-keyring' 'neon' 'openobex' 'python2' 'libunique')
makedepends=('intltool' 'boost')
#changelog=
source=("https://download.01.org/syncevolution/syncevolution/sources/syncevolution-$pkgver.tar.gz"
        "$pkgname-$pkgver-python2.patch")
sha256sums=('8b692bd549a63d2259ed7519afb74fc9cab5be10c7a6f51868b66fc98fb48128'
            'f3cf917615d82512a7720d52c2486a1abd90bbf671debb92c70127b4ee28ce69')

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
