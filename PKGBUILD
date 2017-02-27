#Maintainer: m4sk1n <m4sk1n@vivaldi.net>
#Contributor: Christian Hesse <mail@eworm.de>

pkgname=otter-browser-git
pkgver=0.9.12.r411.g2d874a47
pkgrel=3
pkgdesc='Otter Browser, project aiming to recreate classic Opera (12.x) UI using Qt5 - git checkout'
arch=('x86_64' 'i686')
url='http://otter-browser.org/'
license=('GPL3')
provides=('otter-browser')
conflicts=('otter-browser')
sha256sums=('SKIP')

pkgver() {
	cd otter-browser/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	mkdir -p otter-browser/build/
	cd otter-browser/build/

	cmake -DCMAKE_INSTALL_PREFIX="/usr" ../
	make
}

package() {
	cd otter-browser/

	install -D -m0644 COPYING ${pkgdir}/usr/share/licenses/otter-browser/COPYING

	cd build/

	make DESTDIR=${pkgdir} install

}

