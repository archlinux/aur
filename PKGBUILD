# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: mathieu.clabaut <mathieu.clabaut@gmail.com>
# Contributor: Buce <dmbuce@gmail.com>
# Contributor: Danie Roux <accounts@danieroux.com>

pkgname=etckeeper-git
pkgver=1.18.5.r1.g58ded87
pkgrel=1
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
source=('git://git.kitenet.net/etckeeper')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/etckeeper/"

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

build() {
	cd "${srcdir}/etckeeper/"

	# fix python
	sed -i '/^PYTHON=/c PYTHON=python2' Makefile
	sed -i '1s/python/python2/' zypper-etckeeper.py

	# We want pacman :D
	sed -i -e "/^LOWLEVEL_PACKAGE_MANAGER/c LOWLEVEL_PACKAGE_MANAGER=pacman" \
		-e "/^HIGHLEVEL_PACKAGE_MANAGER/c HIGHLEVEL_PACKAGE_MANAGER=pacman" etckeeper.conf
}

package() {
	cd "${srcdir}/etckeeper/"

	make DESTDIR="${pkgdir}" systemddir=/usr/lib/systemd/system install
}

