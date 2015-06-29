# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: mathieu.clabaut <mathieu.clabaut@gmail.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Danie Roux <accounts@danieroux.com>

pkgname=etckeeper-git
pkgver=1.18.1.r0.gc1bfd1a
pkgrel=3
pkgdesc='collection of tools to let /etc be stored in a git, hg or bzr repository - git checkout'
arch=('any')
url='http://kitenet.net/~joey/code/etckeeper/'
license=('GPL2')
provides=('etckeeper')
conflicts=('etckeeper')
depends=('git')
makedepends=('mercurial' 'bzr')
optdepends=('mercurial: use mercurial for version control'
	'bzr: use bazaar for version control')
backup=('etc/etckeeper/etckeeper.conf')
source=('git://git.kitenet.net/etckeeper'
	'etckeeper.service'
	'etckeeper.timer')
sha256sums=('SKIP'
            'b92c15e4e2d7211ded184dccf3d4b219031eef4bc5fbe0b8d294e8c0f61195fd'
            '256326aaaf5ce44a1b965e102cccd0cba433a76444ad9053428fb9f16428b8e5')

pkgver() {
	cd "${srcdir}/etckeeper/"

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd "${srcdir}/etckeeper/"

	# fix python
	sed -i '/^PYTHON=/c PYTHON=python2' Makefile
	sed -i '1s/python/python2/' zypper-etckeeper.py

	# install path for bash-completion
	sed -i '/bash_completion/s|$(etcdir)/bash_completion.d|${prefix}/share/bash-completion/completions|' Makefile

	# This does not exist, but we do not want the apt stuff installed.
	sed -i -e "/^LOWLEVEL_PACKAGE_MANAGER/c LOWLEVEL_PACKAGE_MANAGER=pacman" \
		-e "/^HIGHLEVEL_PACKAGE_MANAGER/c HIGHLEVEL_PACKAGE_MANAGER=pacman" etckeeper.conf
}

package() {
	cd "${srcdir}/etckeeper/"

	make DESTDIR=${pkgdir} install

	# autocommit timer
	install -D -m0755 debian/cron.daily ${pkgdir}/usr/bin/etckeeper-autocommit
	install -D -m0644 ${srcdir}/etckeeper.service ${pkgdir}/usr/lib/systemd/system/etckeeper.service
	install -D -m0644 ${srcdir}/etckeeper.timer ${pkgdir}/usr/lib/systemd/system/etckeeper.timer
}

