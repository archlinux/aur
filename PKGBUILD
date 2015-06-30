# Maintainer: Alper KANAT <alperkanat@raptiye.org>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=gitosis-git
pkgver=0.2.r49.gdedb3dc
pkgrel=2
pkgdesc='Software for hosting git repositories - git checkout'
url='https://github.com/tv42/gitosis'
arch=('any')
license=('GPL2')
depends=('python2' 'python2-distribute' 'git')
conflicts=('gitosis')
provides=('gitosis')
install=gitosis.install
source=('git://github.com/tv42/gitosis.git')
sha1sums=('SKIP')

pkgver() {
	cd gitosis/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd gitosis/

	python2 setup.py build
}

package() {
	cd gitosis/

	python2 setup.py install --root="${pkgdir}"

	# license
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

	# example configs
	install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/gitosis/README.rst"
	install -Dm644 "example.conf" "${pkgdir}/usr/share/doc/gitosis/example.conf"
	install -Dm644 "gitweb.conf" "${pkgdir}/usr/share/doc/gitosis/gitweb.conf"
	install -Dm644 "lighttpd-gitweb.conf" "${pkgdir}/usr/share/doc/gitosis/lighttpd-gitweb.conf"
}

