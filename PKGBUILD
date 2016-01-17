# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Past contributor: Andreas Schrafl <aschrafl@jetnet.ch>
# based on the work of Jaroslav Lichtblau <tu@dragonlord.cz>
# based on the work of KyAnh, http://kyanh.net/ <xkyanh@gmail.com>

pkgname=boxbackup-client
pkgver=0.12
pkgrel=1
pkgdesc="An open source, completely automatic on-line backup system for UNIX."
arch=('i686' 'x86_64')
url="http://boxbackup.org"
license=('BSD')
depends=('openssl' 'perl' 'zlib')
backup=('etc/boxbackup/bbstored.conf')
source=(https://github.com/boxbackup/boxbackup/archive/${pkgver}.tar.gz bbclient.service)

md5sums=('268bec094ab71d491de497e766c45c87'
         '3ccf31e2cc3027b9243cd8d790ad3170')

build() {
	export MAKEFLAGS="-j1"
	cd boxbackup-${pkgver}

	./bootstrap
	./configure --prefix=/usr --mandir=/usr/share/man --sbindir=/usr/bin

	make
}

package() {

	## their script kind of sucks. so let's do this manually.
	cd ${srcdir}/boxbackup-${pkgver}/parcels/boxbackup-0.12-backup-client-linux-gnu/
	#export DESTDIR=${pkgdir}/${pkgname}
	#make install-backup-client

	install -D bbackupd ${pkgdir}/usr/bin/bbackupd
	install -D bbackupquery ${pkgdir}/usr/bin/bbackupquery
	install -D bbackupctl ${pkgdir}/usr/bin/bbackupctl
	install -D bbackupd-config ${pkgdir}/usr/bin/bbackupd-config
	install -D docs/bbackupd.html ${pkgdir}/usr/share/doc/${pkgname}/bbackupd.html
	install -D docs/bbackupquery.html ${pkgdir}/usr/share/doc/${pkgname}/bbackupquery.html
	install -D docs/bbackupctl.html ${pkgdir}/usr/share/doc/${pkgname}/bbackupctl.html
	install -D docs/bbackupd-config.html ${pkgdir}/usr/share/doc/${pkgname}/bbackupd-config.html
	install -D docs/bbackupd.conf.html ${pkgdir}/usr/share/doc/${pkgname}/bbackupd.conf.html
	install -D bbackupd.8.gz ${pkgdir}/usr/man/man8/bbackupd.8.gz
	install -D bbackupquery.8.gz ${pkgdir}/usr/man/man8/bbackupquery.8.gz
	install -D bbackupctl.8.gz ${pkgdir}/usr/man/man8/bbackupctl.8.gz
	install -D bbackupd-config.8.gz ${pkgdir}/usr/man/man8/bbackupd-config.8.gz
	install -D bbackupd.conf.5.gz ${pkgdir}/usr/man/man5/bbackupd.conf.5.gz

	install -D -m644 "${srcdir}/bbclient.service" "${pkgdir}/usr/lib/systemd/system/bbclient.service"
}
