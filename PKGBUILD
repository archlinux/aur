# Maintainer: ajs124 < aur AT ajs124 DOT de > 

pkgname=firejail
pkgver=0.9.26
pkgrel=1
pkgdesc="Linux namespaces sandbox program"
arch=(i686 x86_64)
license=(GPL2)
url=https://l3net.wordpress.com/projects/firejail/
backup=(etc/firejail/login.users)
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver.tar.bz2)
sha512sums=('10956becbdc55229f77a823e4ad3fb33f90ce61424cd681b405be62223fe88033011c8f758af631b677f34f4b3c944e4c8b1e5ac670534b38e5d33b04047a9bf')

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
