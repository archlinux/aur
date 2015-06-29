# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=iproute2-git
pkgver=4.1.0.r41.g0c4a90c
pkgrel=2
pkgdesc='IP Routing Utilities - git checkout'
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2"
depends=('glibc' 'iptables' 'libmnl')
makedepends=('git' 'linux-atm')
optdepends=('linux-atm: ATM support')
provides=('iproute2')
conflicts=('iproute2' 'iproute')
backup=('etc/iproute2/ematch_map' 'etc/iproute2/rt_dsfield' 'etc/iproute2/rt_protos' \
	'etc/iproute2/rt_realms' 'etc/iproute2/rt_scopes' 'etc/iproute2/rt_tables')
source=('git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git'
	'unwanted-link-help.patch')
sha256sums=('SKIP'
            '3f72492554a5417c13b2b6f6222c158319ce91c0b6c25fd651f49add493323a7')


pkgver() {
	cd iproute2/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

prepare() {
	cd iproute2/

	# allow operations on links called "h", "he", "hel", "help"
	patch -Np1 -i "${srcdir}/unwanted-link-help.patch"

	# do not treat warnings as errors
	sed -i 's/-Werror//' Makefile
}

build() {
	cd iproute2/

	./configure
}

package() {
	cd iproute2/

	make DESTDIR="${pkgdir}" SBINDIR="/usr/bin/" install
}

