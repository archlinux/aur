# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=iproute2-git
pkgver=4.2.0.r44.g8fe9839
pkgrel=1
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
source=('git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git')
sha256sums=('SKIP')

pkgver() {
	cd iproute2/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		printf '%s.r%s.g%s' \
			"$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG})" \
			"$(git rev-list --count ${GITTAG}..)" \
			"$(git log -1 --format='%h')"
	else
		printf '0.r%s.g%s' \
			"$(git rev-list --count master)" \
			"$(git log -1 --format='%h')"
	fi
}

prepare() {
	cd iproute2/

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

