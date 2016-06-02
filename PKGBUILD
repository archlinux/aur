# Maintainer: Arnoud Willemsen <mail at lynthium dot com>

pkgname=firejail-git
pkgver=r1069.0c47e35
pkgrel=1
pkgdesc="Linux namespaces sandbox program (GIT version)"
arch=(i686 x86_64)
license=(GPL2)
url="https://github.com/netblue30/firejail"
backup=('etc/firejail/login.users')
source=("${pkgname}::git+https://github.com/netblue30/firejail.git")
sha512sums=('SKIP')
conflicts=('firejail')
provides=('firejail')

pkgver() {
  	cd "${srcdir}/${pkgname}"
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/^v//;s/-/./g'
}

prepare() {
 	cd "${srcdir}/${pkgname}"
	sed -i '\|bash -c "if \[ ! -f /etc/firejail/login\.users | s|bash -c ".*"$|install -c -m 0644 etc/login.users $(DESTDIR)/etc/firejail/\.|' Makefile.in
}

build() {
  	cd "${srcdir}/${pkgname}"
	# fix build
	export CFLAGS=${CFLAGS/-fsanitize=undefined/}
	./configure --prefix=/usr
	make
}

package() {
  	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}

# vim: set ts=2 sw=2 et:
