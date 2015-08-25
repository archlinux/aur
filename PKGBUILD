# Contributor: Andreas Schrafl <aschrafl@jetnet.ch>
# based on the work of Jaroslav Lichtblau <tu@dragonlord.cz>
# based on the work of KyAnh, http://kyanh.net/ <xkyanh@gmail.com>

pkgname=boxbackup-client
pkgver=0.11.1
pkgrel=0
pkgdesc="An open source, completely automatic on-line backup system for UNIX."
arch=('i686' 'x86_64')
url="http://boxbackup.org"
license=('BSD')
depends=('openssl' 'perl' 'zlib')
backup=('etc/boxbackup/bbstored.conf')
source=(http://boxbackup.org/svn/box/packages/boxbackup-$pkgver.tgz bbclient)

md5sums=('c4c4786a918a9c026f80833614c40a6b'
         '7b8f75b84d277f21923d4e1a6a050105')

build() {
	export MAKEFLAGS="-j1"
	cd ${srcdir}/boxbackup-${pkgver}

	./configure

	mkdir -p ${srcdir}/boxbackup-${pkgver}/parcels/boxbackup-${pkgver}-backup-client-linux-gnu

	make release/bin/bbackupd/bbackupd
	make release/bin/bbackupd/bbackupd
	cp ${srcdir}/boxbackup-${pkgver}/release/bin/bbackupd/bbackupd ${srcdir}/boxbackup-${pkgver}/parcels/boxbackup-${pkgver}-backup-client-linux-gnu/bbackupd

	make release/bin/bbackupquery/bbackupquery
	cp ${srcdir}/boxbackup-${pkgver}/release/bin/bbackupquery/bbackupquery ${srcdir}/boxbackup-${pkgver}/parcels/boxbackup-${pkgver}-backup-client-linux-gnu/bbackupquery

	make release/bin/bbackupctl/bbackupctl
	cp ${srcdir}/boxbackup-${pkgver}/release/bin/bbackupctl/bbackupctl ${srcdir}/boxbackup-${pkgver}/parcels/boxbackup-${pkgver}-backup-client-linux-gnu/bbackupctl

	cp ${srcdir}/boxbackup-${pkgver}/bin/bbackupd/bbackupd-config ${srcdir}/boxbackup-${pkgver}/parcels/boxbackup-${pkgver}-backup-client-linux-gnu/bbackupd-config

  for f in \
    bbackupd \
    bbackupquery \
    bbackupctl \
    bbackupd-config ;\
  do
      install -D -m755 \
        ${srcdir}/boxbackup-$pkgver/parcels/boxbackup-$pkgver-backup-client-linux-gnu/$f \
        ${pkgdir}/usr/bin/$f
  done

  install -D -m755 "${srcdir}/bbclient" "${pkgdir}/etc/rc.d/bbclient"
}
