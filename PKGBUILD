# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libykneomgr-git
pkgver=0.1.7.r4.g42351a9
pkgrel=1
pkgdesc="Yubico YubiKey NEO Manager C Library - git checkout"
arch=('i686' 'x86_64')
url="https://github.com/Yubico/libykneomgr"
license=('BSD')
depends=('pcsclite' 'ccid' 'libzip')
provides=('libykneomgr')
conflicts=('libykneomgr')
makedepends=('git' 'gengetopt' 'help2man')
source=('git://github.com/Yubico/libykneomgr.git')
sha256sums=('SKIP')

pkgver() {
	cd libykneomgr/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd libykneomgr/

	touch ChangeLog
	autoreconf -fi
	./configure --prefix=/usr
	make
}

check() {
	cd libykneomgr/

	make check
}

package() {
	cd libykneomgr/

	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/libykneomgr/COPYING"
	install -D -m0644 README "${pkgdir}/usr/share/doc/libykneomgr/README"
	make DESTDIR="${pkgdir}/" install
}

