# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=vis-git
pkgver=0.r436.gaf43549
pkgrel=1
pkgdesc='suckless vim like editor - git checkout'
arch=('i686' 'x86_64')
url="http://repo.or.cz/vis.git"
depends=('ncurses')
conflicts=('vis')
provides=('vis')
makedepends=('git' 'markdown')
license=('custom')
source=('git://repo.or.cz/vis.git')

pkgver() {
	cd vis/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd vis/

	make

	markdown README.md > README.html
}

package() {
	cd vis/

	make DESTDIR="${pkgdir}" PREFIX='/usr/' install

	install -D -m0644 'LICENSE' "${pkgdir}/usr/share/licenses/vis/LICENSE"
	install -D -m0644 'README.md' "${pkgdir}/usr/share/doc/vis/README.md"
	install -D -m0644 'README.html' "${pkgdir}/usr/share/doc/vis/README.html"
}

sha256sums=('SKIP')
