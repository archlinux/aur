# Maintainer: ajs124 < aur AT ajs124 DOT de > 

pkgname=firejail
pkgver=0.9.30
pkgrel=1
pkgdesc="Linux namespaces sandbox program"
arch=(i686 x86_64)
license=(GPL2)
url=https://l3net.wordpress.com/projects/firejail/
backup=(etc/firejail/login.users)
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver.tar.bz2)
sha512sums=('a7b4940da63d0001673a11e351a7ba7640e9eea2d8475789125ae96d881d7e11a98f437b44b08347a8ec5208c38f471e2d4cf84ed5d2314b763c1207ceceb56e')

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
