# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Benjamin Bukowski <benjamin.bukowski@gmail.com>

pkgname=atftp-git
pkgver=0.7.1.r1.gf9dbb96
pkgrel=1
pkgdesc='a client/server implementation of the TFTP protocol - git checkout'
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/atftp/"
license=('GPL')
depends=('pcre' 'readline')
conflicts=('atftp')
provides=('atftp')
backup=('etc/conf.d/atftpd')
source=('atftp::git://git.code.sf.net/p/atftp/code'
	'atftpd.conf'
	'atftpd.service')

pkgver() {
	cd atftp/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

prepare() {
	cd atftp/

	sed -i 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.ac
}


build() {
	cd atftp/

	./autogen.sh
	./configure --prefix=/usr \
		--mandir=/usr/share/man \
		--sbindir=/usr/bin \
		--enable-libreadline \
		--disable-libwrap
	make
}

package() {
	cd atftp/

	make DESTDIR="${pkgdir}" install

	install -D -m0644 "${srcdir}/atftpd.conf" "${pkgdir}/etc/conf.d/atftpd"
	install -D -m0644 "${srcdir}/atftpd.service" "${pkgdir}/usr/lib/systemd/system/atftpd.service"
	install -d -m0775 --group=nobody "${pkgdir}/var/tftpboot"

	# remove in.tftpd link as it conflicts with extra/tftp-hpa
	rm "${pkgdir}/usr/share/man/man8/in.tftpd.8"
	rm "${pkgdir}/usr/bin/in.tftpd"
}

sha256sums=('SKIP'
            '100225ede793b9c01d0c5bcb9c2cc1933552609d3a9439b9bd03dfa0b269143e'
            '77e7e40d5d0749d18ddeed434ed2cc0d9c6d56609d9c106da78499e1b03c1c35')
