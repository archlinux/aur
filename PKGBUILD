# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=claws-contacts-git
pkgver=0.r99.g5c40728
pkgrel=2
pkgdesc='A GTK+ based contacts manager / address book - git checkout'
arch=('i686' 'x86_64')
license=('GPL3')
url='http://www.claws-mail.org/'
depends=('gtk2' 'dbus-glib')
makedepends=('git')
conflicts=('claws-contacts' 'claws-contacts-cvs')
provides=('claws-contacts' 'claws-contacts-cvs')
options=(!libtool)
install=claws-contacts.install
source=('claws-contacts::git://git.claws-mail.org/contacts.git')
sha256sums=('SKIP')

pkgver() {
	cd claws-contacts/

	#if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
	#	echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	#else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	#fi
}

build() {
	cd claws-contacts/

	./autogen.sh \
		--prefix=/usr \
		--disable-static
	for MAKEFILE in $(find -name Makefile); do
		sed -i '/^LIBS =/s/$/ -lm/' ${MAKEFILE}
	done
	make
}

package() {
	cd claws-contacts/

	make DESTDIR=${pkgdir} install
}

