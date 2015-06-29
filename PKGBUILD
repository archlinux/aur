# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=rsync-git
pkgver=3.1.1.r0.g7cb0de6
pkgrel=1
pkgdesc="A file transfer program to keep remote files in sync - git checkout"
arch=('i686' 'x86_64')
url="http://rsync.samba.org/"
license=('GPL3')
depends=('perl' 'popt' 'acl' 'zlib')
makedepends=('git' 'yodl')
provides=('rsync')
conflicts=('rsync')
backup=('etc/rsyncd.conf' 'etc/xinetd.d/rsync')
source=('git://git.samba.org/rsync.git'
        'rsyncd.conf' 'rsync.xinetd' 'rsyncd.service'
        'rsyncd.socket' 'rsyncd@.service')
sha256sums=('SKIP'
            '733ccb571721433c3a6262c58b658253ca6553bec79c2bdd0011810bb4f2156b'
            'da0ec9ce07bf2edafbc8e44020da29a58038b00c3048a22de57017c56318a767'
            'a227bf3c2218e0de1e7396751244ea92dd410600a6469f283f0fa3bead56cd0a'
            '551f17407de0e539c8419fc2cd48dd0124eb0253a186690b165b51703ffad1a5'
            'b8ab53dde01be38e57f49d29941841249eb74a9f137ff2e28cc985acc5199492')

pkgver() {
	cd rsync/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd rsync/

	./prepare-source
	./configure --prefix=/usr \
		--with-included-popt=no \
		--with-included-zlib=no \
		--enable-acl-support \
		--enable-xattr-support \
		--disable-debug
	make
}

check() {
	cd rsync/

	make test
}


package() {
	cd rsync

	make DESTDIR="${pkgdir}" install

	install -Dm644 ../rsyncd.conf "$pkgdir/etc/rsyncd.conf"
	install -Dm644 ../rsync.xinetd "$pkgdir/etc/xinetd.d/rsync"
	install -Dm644 ../rsyncd.service "$pkgdir/usr/lib/systemd/system/rsyncd.service"
	install -m644 ../rsyncd.socket "$pkgdir/usr/lib/systemd/system/rsyncd.socket"
	install -m644 ../rsyncd@.service "$pkgdir/usr/lib/systemd/system/rsyncd@.service"
	install -Dm755 support/rrsync "$pkgdir/usr/lib/rsync/rrsync"
}

