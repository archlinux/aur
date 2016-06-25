# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past contributor: Andreas Schrafl <aschrafl@jetnet.ch>
# based on the work of Jaroslav Lichtblau <tu@dragonlord.cz>
# based on the work of KyAnh, http://kyanh.net/ <xkyanh@gmail.com>

pkgname=boxbackup-server
pkgver=0.12
pkgrel=3
pkgdesc="An open source, completely automatic on-line backup system for UNIX."
arch=('i686' 'x86_64')
url="http://boxbackup.org"
license=('BSD')
depends=('openssl' 'perl' 'zlib')
backup=('etc/boxbackup/bbstored.conf')
source=("https://github.com/boxbackup/boxbackup/archive/${pkgver}.tar.gz"
	"bbserver.service"
	"${pkgver}.tar.gz.sig"
	"bbserver.service.sig")

sha512sums=('fed06f379c03ab73e884639f90f926050e07df85a5de6ee22a109210267d469e345110e28bcc5b1c78103301cefbf74279e13c720ca28751340b2609122d84af'
            '0f35aadb21129dd3eb9574a6d5fdbbf05cd6df3a11aaa63fba44c03085ce02391c2c2b016a71d04c177e7e7d27179d548ddd42a8ab635fa1eb0af2073d1be95f'
            'SKIP'
            'SKIP')

build() {
	export MAKEFLAGS="-j1"
	cd boxbackup-${pkgver}

	./bootstrap
	./configure --prefix=/usr --mandir=/usr/share/man --sbindir=/usr/bin

	make
}

package() {

	## their script kind of sucks. so let's do this manually.
	cd ${srcdir}/boxbackup-${pkgver}/parcels/boxbackup-0.12-backup-server-linux-gnu/
	#export DESTDIR=${pkgdir}/${pkgname}
	#make install-backup-server

	install -D bbstored ${pkgdir}/usr/bin/bbstored
	install -D bbstoreaccounts ${pkgdir}/usr/bin/bbstoreaccounts
	install -D bbstored-certs ${pkgdir}/usr/bin/bbstored-certs
	install -D bbstored-config ${pkgdir}/usr/bin/bbstored-config
	install -D raidfile-config ${pkgdir}/usr/bin/raidfile-config
	install -D docs/bbstored.html ${pkgdir}/usr/share/doc/${pkgname}/bbstored.html
	install -D docs/bbstoreaccounts.html ${pkgdir}/usr/share/doc/${pkgname}/bbstoreaccounts.html
	install -D docs/bbstored-certs.html ${pkgdir}/usr/share/doc/${pkgname}/bbstored-certs.html
	install -D docs/bbstored-config.html ${pkgdir}/usr/share/doc/${pkgname}/bbstored-config.html
	install -D docs/raidfile-config.html ${pkgdir}/usr/share/doc/${pkgname}/raidfile-config.html
	install -D docs/bbstored.conf.html ${pkgdir}/usr/share/doc/${pkgname}/bbstored.conf.html
	install -D docs/raidfile.conf.html ${pkgdir}/usr/share/doc/${pkgname}/raidfile.conf.html
	install -D bbstored.8.gz ${pkgdir}/usr/man/man8/bbstored.8.gz
	install -D bbstoreaccounts.8.gz ${pkgdir}/usr/man/man8/bbstoreaccounts.8.gz
	install -D bbstored-certs.8.gz ${pkgdir}/usr/man/man8/bbstored-certs.8.gz
	install -D bbstored-config.8.gz ${pkgdir}/usr/man/man8/bbstored-config.8.gz
	install -D raidfile-config.8.gz ${pkgdir}/usr/man/man8/raidfile-config.8.gz
	install -D bbstored.conf.5.gz ${pkgdir}/usr/man/man5/bbstored.conf.5.gz
	install -D raidfile.conf.5.gz ${pkgdir}/usr/man/man5/raidfile.conf.5.gz

	install -D -m644 "${srcdir}/bbserver.service" "${pkgdir}/usr/lib/systemd/system/bbserver.service"
}
