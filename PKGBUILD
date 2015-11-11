# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gerhard Brauer <gerbra@archlinux.de>

pkgname=nbd-git
pkgver=3.12.1.r2.g78a6576
pkgrel=1
pkgdesc="tools for network block devices, allowing you to use remote block devices over TCP/IP - git checkout"
arch=('i686' 'x86_64')
url="http://nbd.sourceforge.net"
license=('GPL')
backup=('etc/nbd-server/config')
depends=('glib2')
makedepends=('git' 'docbook2x' 'docbook-sgml' 'docbook-xml')
conflicts=('nbd')
provides=('nbd')
install=nbd.install
source=('nbd::git://git.code.sf.net/p/nbd/code'
        '0001-fix-sgml-syntax-in-man-pages.patch'
	'config' 'nbd.service')
sha256sums=('SKIP'
            'cfd9f636ca7aeb5c62bc9e219af4d451cc31df137eefdd44fc962e90a28da241'
            '3417489abd36f978cd681b69035f5e6ddf888b76d90bc333b833382d939756b8'
            '7f57d8764f9bf974ed407835467141ff54c9ed05471312a20437b398834c1f0c')

pkgver() {
	cd nbd/

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

prepare() {
	cd nbd/

	patch -Np1 < "${srcdir}"/0001-fix-sgml-syntax-in-man-pages.patch
}

build(){
	cd nbd/

	./autogen.sh

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-syslog \
		--sbindir=/usr/bin

	make
}

package() {
	cd nbd/

	make DESTDIR="${pkgdir}" install

	install -D -m644 "${srcdir}"/config "${pkgdir}"/etc/nbd-server/config
	install -D -m644 "${srcdir}"/nbd.service "${pkgdir}"/usr/lib/systemd/system/nbd.service

	install -D -m644 doc/README "${pkgdir}"/usr/share/doc/nbd/README
}

