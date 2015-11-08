# Maintainer: ajs124 < aur AT ajs124 DOT de > 

pkgname=firejail
pkgver=0.9.34
pkgrel=1
pkgdesc="Linux namespaces sandbox program"
arch=(i686 x86_64)
license=(GPL2)
url=https://l3net.wordpress.com/projects/firejail/
backup=(etc/firejail/login.users)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/netblue30/${pkgname}/archive/$pkgver.tar.gz)
sha512sums=('89782b34a86e00160fba23ebf6b43e0c5ab64c543003969ca3eae0cc67140962f6365f0089424e906c1e08414768fd9b28cdb66e27e07414c9c6bfb16580dd10')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i '\|bash -c "if \[ ! -f /etc/firejail/login\.users | s|bash -c ".*"$|install -c -m 0644 etc/login.users $(DESTDIR)/etc/firejail/\.|' Makefile.in
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# fix build
	export CFLAGS=${CFLAGS/-fsanitize=undefined/}
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
