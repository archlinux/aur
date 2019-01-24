# Maintainer: Bjoern Franke <bjo@nord-west.org>


pkgname=spectrum2-git
pkgver=r2042.3fb32baf
pkgrel=1
#epoch=
pkgdesc="an open source instant messaging transport"
arch=('any')
url="http://spectrum.im"
license=('GPL')
groups=()
depends=(curl 'log4cxx' popt sqlite)
makedepends=('protobuf' 'swiften>=4' 'libpqxx' 'libpurple' 'avahi' 'boost'
'cmake' 'cppunit' 'expat' 'libcommuni' 'libidn' 'sqlite' 'log4cxx' 'libevent'
'libmariadbclient' 'popt' 'libev' 'dbus-glib' 'curl' 'gconf')
checkdepends=()
optdepends=('swiften: XMPP backend support'
            'libpqxx: PostgreSQL support'
            'libmariadbclient: MariaDB support'
            'libcommuni: IRC backend support'
	    'qt5: IRC backend support'
            'protobuf: IRC backend support'
            'libpurple: LibPurple backend support'
	    'gconf: LibPurple backend support'
            'libev: LibPurple backend support - libev eventloop')
provides=('spectrum2')
conflicts=('spectrum2')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/SpectrumIM/spectrum2.git"
        'spectrum2.service')
sha256sums=('SKIP'
            '8b95ddcf90449dcd0dec111276c69d04a92d09a0f9e1815009b2179a8050c9d1')

noextract=()
validpgpkeys=()

pkgver() {
    cd "${srcdir}/spectrum2"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/spectrum2"
	cmake .  -DENABLE_QT4=OFF -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_STANDARD=14 -DCMAKE_INSTALL_PREFIX=/usr -DSPECTRUM_VERSION=${pkgver} -DIRC_INCLUDE_DIR=/usr/include/qt/Communi
	make
}

package() {
	cd "$srcdir/spectrum2"
	make DESTDIR="$pkgdir/" install
	install -D -m0644 "$srcdir/$pkgname-$pkgver/spectrum_manager/src/spectrum_manager.cfg" "$pkgdir/etc/spectrum2/"
	install -D -m0644 "$srcdir/spectrum2.service" "$pkgdir/usr/lib/systemd/system/spectrum2.service"
}
