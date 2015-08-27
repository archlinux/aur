# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libu2f-host-git
pkgver=1.0.0.r0.g5e02a19
pkgrel=1
pkgdesc="Yubico Universal 2nd Factor (U2F) Host C Library - git checkout"
arch=('i686' 'x86_64')
url='https://github.com/Yubico/libu2f-host'
license=('BSD')
depends=('json-c' 'hidapi')
makedepends=('git' 'help2man' 'gtk-doc' 'gengetopt')
provides=('libu2f-host')
conflicts=('libu2f-host')
install=libu2f-host.install
source=('git://github.com/Yubico/libu2f-host.git'
	'makefile.patch')
sha256sums=('SKIP'
            '15355aade08033f8373d85017534297ebceb4e2874334109a24e368aea7ac2c0')

pkgver() {
	cd libu2f-host/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build() {
	cd libu2f-host/

	patch -Np1 < "${srcdir}/makefile.patch"

	autoreconf -fi
	./configure \
		--prefix=/usr \
		--enable-gtk-doc \
		--with-udevrulesdir=/usr/lib/udev/rules.d/
	make
}


check() {
	cd libu2f-host/

	make check
}

package() {
	cd libu2f-host/

	make DESTDIR="${pkgdir}/" install

	install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

