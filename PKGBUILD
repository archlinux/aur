# Maintainer: Bjoern Franke <bjo@nord-west.org>


pkgname=spectrum2
pkgver=2.0.9
pkgrel=3
#epoch=
pkgdesc="an open source instant messaging transport"
arch=('any')
url="http://spectrum.im"
license=('GPL')
groups=()
depends=(curl 'log4cxx' popt sqlite)
makedepends=('protobuf' 'swiften>=3' 'libpqxx' 'libpurple' 'avahi' 'boost'
'cmake' 'cppunit' 'expat' 'libcommuni' 'libidn' 'sqlite' 'log4cxx' 'libevent'
'libmariadbclient' 'popt' 'libev' 'dbus-glib' 'curl' 'qt4' 'gconf')
checkdepends=()
optdepends=('swiften: XMPP backend support'
            'libpqxx: PostgreSQL support'
            'libmariadbclient: MariaDB support'
            'libcommuni: IRC backend support'
	    'qt4: IRC backend support'
            'protobuf: IRC backend support'
            'libpurple: LibPurple backend support'
	    'gconf: LibPurple backend support'
            'libev: LibPurple backend support - libev eventloop')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/hanzz/$pkgname/archive/$pkgver.tar.gz"
        'spectrum2.service'
	'boost.patch')
sha256sums=('e536a65ef86aafdc6d87f3c6b5bce919a67054dd01f757a2dbc82acbbdd0fa87'
            '8b95ddcf90449dcd0dec111276c69d04a92d09a0f9e1815009b2179a8050c9d1'
            'e73973fdc07b448170c1ce7d252af900fd8c68defe67f0876693d2ea8b4ba97c')

noextract=()
validpgpkeys=()


prepare() {
	cd "$srcdir"
	patch -p1 -d "$pkgname-$pkgver" < boost.patch
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake . -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_STANDARD=14 -DCMAKE_INSTALL_PREFIX=/usr -DSPECTRUM_VERSION=${pkgver} -DIRC_INCLUDE_DIR=/usr/include/qt/Communi
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m0644 "$srcdir/$pkgname-$pkgver/spectrum_manager/src/spectrum_manager.cfg" "$pkgdir/etc/spectrum2/"
	install -D -m0644 "$srcdir/spectrum2.service" "$pkgdir/usr/lib/systemd/system/spectrum2.service"
}
