# Maintainer: hashworks <mail@hashworks.net>

pkgname=goaccess-git
_pkgname="${pkgname%-git}"
pkgrel=1
pkgver=1.4.r20.gd6fb1252
pkgdesc="A real-time web log analyzer and interactive viewer that runs in a terminal in *nix systems or through your browser"
url='https://goaccess.io'
license=('MIT')
arch=('x86_64')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('ncurses' 'libmaxminddb' 'openssl')
optdepends=('geoip2-database: for geoip support')
makedepends=('git')
backup=('etc/goaccess/goaccess.conf' 'etc/goaccess/browsers.list' 'etc/goaccess/podcast.list')
source=('git+https://github.com/allinurl/goaccess.git')
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	autoreconf -fiv
	./configure --enable-geoip=mmdb --enable-utf8 --with-openssl --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "${_pkgname}"
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	make DESTDIR="${pkgdir}" install
}
