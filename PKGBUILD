#Maintainer: Christian Hesse <mail@eworm.de>
#Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>

pkgname=giggle-git
pkgver=0.5.r289.g44490f7
pkgrel=1
pkgdesc='A graphical frontend for the git directory tracker - git checkout'
arch=('i686' 'x86_64')
url='http://live.gnome.org/giggle'
license=('GPL')
depends=('git' 'gtksourceview3' 'vte3')
options=(!libtool)
install=giggle.install
provides=('giggle')
conflicts=('giggle')
source=('git://git.gnome.org/giggle')
sha256sums=('SKIP')

pkgver() {
	cd giggle/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd giggle/

	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd giggle/

	make prefix=${pkgdir}/usr install
	# this file shouldn't be here
	rm ${pkgdir}/usr/share/icons/hicolor/icon-theme.cache
}

