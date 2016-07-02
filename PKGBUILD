# Maintainer: Justus Piater <Justus-dev at Piater dot name>
pkgname=('syncevolution' 'syncevolution-http')
pkgver=1.5.1
pkgrel=1
pkgdesc="Synchronize PIM data via various protocols"
arch=('i686' 'x86_64')
url="https://syncevolution.org/"
license=('LGPL')
depends=('evolution-data-server' 'neon' 'openobex' 'python2' 'libunique')
makedepends=('intltool' 'boost')
#changelog=
source=("https://download.01.org/syncevolution/syncevolution/sources/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver-casts.patch"
        "$pkgname-$pkgver-libical2.patch"
        "$pkgname-$pkgver-python2.patch")
sha256sums=('39f52049006c4a703bfe4b7cea3bb3298fe61b4ba9a8dbc367492409e4091c70'
            'c72fcc0f06d7958fbef98ffd379ebc95407d7bd29924e6ba63507ba7f82fcac6'
            'e12fd70af74b2771c6a83a6f42cfd64a943e9e5d3db93624865b08476d4b8f2c'
            '3ccb195d45de1c1ad87f76dfc5927997988afa7031feb9f335fab63d6a317910')

prepare() {
    cd "$pkgname-$pkgver"
    for patch in casts libical2 python2; do
      patch -p1 -i "$srcdir/$pkgname-$pkgver-$patch.patch"
    done
}

build() {
    cd "$pkgname-$pkgver"
    export CXXFLAGS="$CXXFLAGS -std=gnu++98"
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
