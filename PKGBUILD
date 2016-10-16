# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Stewart Starbuck <stewart@stewartstarbuck.co.uk>

_pkgname=merecat
pkgname=merecat-git
pkgver=20161009.a09e416
pkgrel=1
pkgdesc='Simple, small and fast HTTP server'
url='https://github.com/troglobit/merecat'
license=('custom:BSD')
arch=('i686' 'x86_64')
backup=('etc/merecat.conf')
depends=('confuse')
makedepends=('git')
source=("git+${url}"
        'service'
        'config')
sha1sums=('SKIP'
          'a85431c51628a0392c8d276075ffdbe231bce83e'
          '6f6d3529a4ebde2273e9a7017fdad3fd8726ade1')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh
}

build() {
	cd "${srcdir}/${_pkgname}"
	export WEBDIR=/srv/http
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \

	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install install-data

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 ../service "${pkgdir}"/usr/lib/systemd/system/merecat.service
	install -Dm644 ../config "${pkgdir}"/etc/merecat.conf

	# clean stuff up
	rm -fr "${pkgdir}"/srv
	rm "${pkgdir}"/usr/bin/{in.httpd,httpd}
	rm "${pkgdir}"/usr/share/man/man8/{redirect,ssi,httpd,in.httpd}.8

	# avoid conflicts with apache
	mv "${pkgdir}"/usr/bin/htpasswd{,-merecat}
	mv "${pkgdir}"/usr/share/man/man1/htpasswd{,-merecat}.1
}
