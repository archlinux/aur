# $Id: PKGBUILD 135280 2015-06-13 19:44:48Z bisson $
# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Stewart Starbuck <stewart@stewartstarbuck.co.uk>

pkgname=thttpd
pkgver=2.26
pkgrel=5
pkgdesc='Simple, small, portable, fast, and secure HTTP server'
url='http://www.acme.com/software/thttpd/'
license=('custom:BSD')
arch=('i686' 'x86_64')
backup=('etc/thttpd.conf')
source=("http://www.acme.com/software/thttpd/${pkgname}-${pkgver}.tar.gz"
        'forwarded-for.patch'
        'discreet.patch'
        'crypt.patch'
        'service'
        'config')
sha1sums=('9b943aeeab9ef92dfd60595649cbe9cf7394968c'
          '1293fbaf83a489c65d6d2b107d797c687233d96a'
          'b954028d4360ad856f7fb1edc8534f0652f33d20'
          '603007a9292e84eea864b9ffb3bdf34c7e4dd8c9'
          '73bd76de0e89a9cc31e5605659837d83b3c8dfde'
          '7a6413491b6ba68625d450caa3c6f071af0ca1ac')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 -i ../forwarded-for.patch
	patch -p1 -i ../discreet.patch
	patch -p1 -i ../crypt.patch
	sed \
		-e 's/^CFLAGS =/CFLAGS +=/' \
		-e '/^STATICFLAG =/c STATICFLAG =' \
		-i {*/,}Makefile.in
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# ./configure messes up DEFS when FORTIFY_SOURCE=1
	CPPFLAGS= ./configure \
		--prefix=/usr \
		--mandir=/usr/share/man \

	CFLAGS+=" $CPPFLAGS"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -d "${pkgdir}"/usr/share/man/man1
	make \
		BINDIR="${pkgdir}"/usr/bin \
		WEBDIR="${pkgdir}"/srv/http \
		MANDIR="${pkgdir}"/usr/share/man \
		WEBGROUP=root \
		install

	rm -fr "${pkgdir}"/srv
	chown root:root -R "${pkgdir}"
	chmod 755 -R "${pkgdir}"/usr/bin # strip needs u+w

	install -Dm644 ../config "${pkgdir}"/etc/thttpd.conf
	install -Dm644 ../service "${pkgdir}"/usr/lib/systemd/system/thttpd.service

	install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
	head -n 26 thttpd.c > "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

	# conflicts with apache
	mv "${pkgdir}"/usr/bin/htpasswd{,-thttpd}
	mv "${pkgdir}"/usr/share/man/man1/htpasswd{,-thttpd}.1
}
