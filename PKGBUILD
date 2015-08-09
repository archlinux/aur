# Maintainer: Dennis Fink <the_metalgamer@hackerspace.lu>
#
# Heavily based on the thttpd PKGBUILD

pkgname=sthttpd
pkgver=2.27.0
pkgrel=1
pkgdesc='Simple, small, portable, fast, and secure HTTP server'
url='http://opensource.dyc.edu/sthttpd'
license=('custom:BSD')
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
backup=('etc/thttpd.conf')
source=("http://opensource.dyc.edu/pub/sthttpd/${pkgname}-${pkgver}.tar.gz"
        'logrotate.d'
        'service'
        'config'
        )
conflicts=('thttpd')
sha1sums=('40dabbc0ba3769241a9f0cbe55428f3f0e941378'
          '36ffeefd1675ca4920605b1b5ca32dd5141a8f23'
          '73bd76de0e89a9cc31e5605659837d83b3c8dfde'
          '16640870a69cfc48021ee3acfea7c95834549d46'
          '5f0e499ecd3371f7f495e4c751ccfcbfdcd20e14')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr --mandir=/usr/share/man
	sed "s/^CFLAGS =/CFLAGS = ${CFLAGS} /" -i Makefile */Makefile
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -d "${pkgdir}"/usr/{bin,share/man/man{1,8}}
	make \
		bindir="${pkgdir}"/usr/bin \
		sbindir="${pkgdir}"/usr/bin \
		WEBDIR="${pkgdir}"/srv/http \
		mandir="${pkgdir}"/usr/share/man \
		WEBGROUP=root install

	rm -fr "${pkgdir}"/srv
	chown root:root -R "${pkgdir}"
	chmod 755 -R "${pkgdir}"/usr/bin # strip needs u+w

	install -Dm644 ../config "${pkgdir}"/etc/thttpd.conf
	install -Dm644 ../service "${pkgdir}"/usr/lib/systemd/system/thttpd.service
	install -Dm644 ../logrotate.d "${pkgdir}"/etc/logrotate.d/thttpd

	install -d "${pkgdir}"/{usr/share/licenses/"${pkgname}",var/log/thttpd}
    head -n 26 src/thttpd.c > "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
sha1sums=('27ea739c4e3c7922979c4357a80fe6d141da4356'
          '36ffeefd1675ca4920605b1b5ca32dd5141a8f23'
          '73bd76de0e89a9cc31e5605659837d83b3c8dfde'
          '16640870a69cfc48021ee3acfea7c95834549d46')
