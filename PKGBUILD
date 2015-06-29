# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=bnbd-git
pkgver=1.0.0.r39.g83a64d6
pkgrel=1
pkgdesc="an alternative NBD (network block device) server implementation - git checkout"
arch=('x86_64' 'i686')
url="http://code.belo.io/bnbd/"
license=('2-clause BSD')
depends=('libaio' 'pcre' 'nbd')
makedepends=('git')
provides=('bnbd')
conflicts=('bnbd')
backup=('etc/bnbd/bnbd-server.conf')
source=('git+https://bitbucket.org/belczyk/bnbd.git'
	'bnbd.service')
sha256sums=('SKIP'
            'f96735e1b885873787ce88e932c2d7413e19a034aab7c64b369661cc69c88774')

pkgver() {
	cd bnbd/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd bnbd/

	make
}

package() {
	cd bnbd/

	# install
	make DESTDIR="${pkgdir}/" install

	# copy config in place
	install -D -m0644 ${pkgdir}/etc/bnbd/bnbd-server.conf.sample ${pkgdir}/etc/bnbd/bnbd-server.conf

	# systemd unit file
	install -D -m0644 ${srcdir}/bnbd.service ${pkgdir}/usr/lib/systemd/system/bnbd.service

	# directories
	install -d -m0750 ${pkgdir}/var/lib/bnbd-server
	install -d -m0755 ${pkgdir}/var/lib/bnbd-server/ctrl
	install -d -m0755 ${pkgdir}/var/lib/bnbd-server/data
}

