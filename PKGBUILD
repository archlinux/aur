pkgname=spectrum2
pkgver=2.2.1
pkgrel=1
pkgdesc="an open source instant messaging transport"
arch=('any')
url="http://spectrum.im"
license=('GPL')
depends=(curl 'log4cxx' popt sqlite)
makedepends=('protobuf' 'swiften>=4' 'libpqxx' 'libpurple' 'avahi' 'boost'
             'cmake' 'cppunit' 'expat' 'libcommuni' 'libidn' 'sqlite' 'log4cxx' 'libevent'
             'libmariadbclient' 'popt' 'libev' 'dbus-glib' 'curl' 'gconf')
optdepends=('swiften: XMPP backend support'
            'libpqxx: PostgreSQL support'
            'libmariadbclient: MariaDB support'
            'libcommuni: IRC backend support'
            'protobuf: IRC backend support'
            'libpurple: LibPurple backend support'
            'gconf: LibPurple backend support'
            'libev: LibPurple backend support - libev eventloop')
source=("https://github.com/SpectrumIM//$pkgname/archive/$pkgver.tar.gz"
        'spectrum2.service')
sha256sums=('9215bde81bfd94a537fb7fc6ce49ef525e5796afc7de4ff0da4425fbb142196f'
            '8b95ddcf90449dcd0dec111276c69d04a92d09a0f9e1815009b2179a8050c9d1')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake . \
		-DCMAKE_BUILD_TYPE=Debug \
		-DENABLE_QT4=OFF \
		-DCMAKE_CXX_STANDARD=14 \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSPECTRUM_VERSION=${pkgver} \
		-DIRC_INCLUDE_DIR=/usr/include/qt/Communi
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m0644 "$srcdir/$pkgname-$pkgver/spectrum_manager/src/spectrum_manager.cfg" "$pkgdir/etc/spectrum2/spectrum_manager.cfg"
	install -D -m0644 "$srcdir/spectrum2.service" "$pkgdir/usr/lib/systemd/system/spectrum2.service"
}
