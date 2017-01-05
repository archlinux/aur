# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=libu2f-host-git
pkgver=1.1.3.r9.gc32e7a6
pkgrel=1
pkgdesc='Yubico Universal 2nd Factor (U2F) Host C Library - git checkout'
arch=('i686' 'x86_64')
url='https://github.com/Yubico/libu2f-host'
license=('BSD')
depends=('json-c' 'hidapi')
makedepends=('git' 'help2man' 'gtk-doc' 'gengetopt')
provides=('libu2f-host')
conflicts=('libu2f-host')
source=('git://github.com/Yubico/libu2f-host.git')
sha256sums=('SKIP')

pkgver() {
	cd libu2f-host/

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
	cd libu2f-host/

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

