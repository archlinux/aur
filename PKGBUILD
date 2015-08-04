# Maintainer: ajs124 < aur AT ajs124 DOT de > 

pkgname=firejail
pkgver=0.9.28
pkgrel=1
pkgdesc="Linux namespaces sandbox program"
arch=(i686 x86_64)
license=(GPL2)
url=https://l3net.wordpress.com/projects/firejail/
backup=(etc/firejail/login.users)
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver.tar.bz2)
sha512sums=('a0c6715cbaf1043f2ea92b33da5884b6ed0993b3e5d03a3edd181b6663a696a2a60a44e0ad39fc9fcfd50d79eb5acb2f0f33452467bf50912f558ec23ebfc125')

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
