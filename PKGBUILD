# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Gerhard Brauer <gerbra@archlinux.de>

pkgname=nbd-git
pkgver=3.8.r10.ga8c85e5
pkgrel=2
pkgdesc="tools for network block devices, allowing you to use remote block devices over TCP/IP - git checkout"
arch=('i686' 'x86_64')
url="http://nbd.sourceforge.net"
license=('GPL')
backup=('etc/nbd-server/config')
depends=('glib2')
makedepends=('git' 'docbook2x' 'opensp' 'perl-xml-libxml')
conflicts=('nbd')
provides=('nbd')
install=nbd.install
source=('nbd::git://git.code.sf.net/p/nbd/code'
	'compile.patch'
	config nbd.service)
sha256sums=('SKIP'
            '51418f47722dda5f666e7e2cf5ea8f2c0366208535cc3c5ff00ad28375468aee'
            '3417489abd36f978cd681b69035f5e6ddf888b76d90bc333b833382d939756b8'
            '7f57d8764f9bf974ed407835467141ff54c9ed05471312a20437b398834c1f0c')

pkgver() {
	cd nbd/

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
	fi
}

build(){
	cd nbd/

	for file in man/*.sgml; do
		osx -xlower -xno-nl-in-tag ${file} > ${file/.sgml/.xml} || true
		mv ${file/.sgml/.xml} ${file}
	done

	sed -i 's/docbook2man/docbook2man --sgml/' man/Makefile.am

	patch -Np1 < ${srcdir}/compile.patch

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

