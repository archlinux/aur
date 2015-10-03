# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=lirc-git
_pkgname=lirc
pkgver=r2798.f996254
pkgrel=1
pkgdesc="Linux Infrared Remote Control utils. Git version."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.lirc.org/"
depends=('alsa-lib' 'libx11' 'libftdi-compat' 'libirman')
makedepends=('help2man' 'alsa-lib' 'libx11' 'libftdi-compat' 'libirman'
'libxslt' 'python' 'git' 'python-yaml')
optdepends=('python: for lirc-setup, irdb-get and pronto2lirc')
provides=('lirc-utils')
conflicts=('lirc-utils' 'lirc')
replaces=('lirc-utils')
backup=('etc/lirc/lirc_options.conf' 'etc/lirc/lircd.conf' 'etc/lirc/lircmd.conf')
install=lirc.install
source=("git://lirc.git.sourceforge.net/gitroot/lirc/lirc"
lirc.logrotate lirc.tmpfiles)
md5sums=('SKIP'
'3deb02604b37811d41816e9b4385fcc3'
'febf25c154a7d36f01159e84f26c2d9a')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	./autogen.sh
	./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc \
		--localstatedir=/var --with-transmitter --enable-sandboxed 
	make
}

package() {
	cd "$srcdir/$_pkgname"

	make DESTDIR="${pkgdir}" install
	install -Dm644 "${srcdir}"/lirc.tmpfiles \
		"${pkgdir}"/usr/lib/tmpfiles.d/lirc.conf
	install -Dm644 "${srcdir}"/lirc.logrotate \
		"${pkgdir}"/etc/logrotate.d/lirc

	rmdir "${pkgdir}"/var/{run/lirc/,run/,}
}
