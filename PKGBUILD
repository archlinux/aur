# Maintainer: Florian Maunier <fmaunier@gmail.com>

pkgname=libu2f-server-git
pkgver=1.0.1.r50.g7485f4e
pkgrel=1
pkgdesc="Yubico Universal 2nd Factor (U2F) Server C Library - git checkout"
arch=('i686' 'x86_64')
url='https://github.com/Yubico/libu2f-server'
license=('BSD')
depends=('openssl' 'json-c')
makedepends=('check' 'git' 'gengetopt')
provides=('libu2f-server')
conflicts=('libu2f-server')
source=('git://github.com/Yubico/libu2f-server.git')
sha256sums=('SKIP')

pkgver() {
	cd libu2f-server/

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
	cd libu2f-server/

    autoreconf -fi
	./configure \
        --prefix=/usr

	make
}

check() {
	cd libu2f-server/

	make check
}

package() {
	cd libu2f-server/

	make DESTDIR="${pkgdir}/" install

    install -D -m0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
