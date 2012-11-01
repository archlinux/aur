# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Patrick Burroughs (Celti) <celticmadman@gmail.com>
# Maintainer: Florian Bruhin (The-Compiler) <archlinux.org@the-compiler.org>

pkgname=bitlbee-bzr
pkgver=916
pkgrel=1
pkgdesc='Brings instant messaging (XMPP, MSN, Yahoo!, AIM, ICQ, Twitter) to IRC'
url="http://bitlbee.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('openssl' 'glib2')
makedepends=('bzr' 'asciidoc' 'libotr' 'xmlto' 'lynx')
optdepends=('skype4py: to use skyped'
            'libotr: for OTR encryption support'
            'xinetd: to run bitlbee through xinetd')
source=('xinetd' 'rc.d')
sha1sums=('5e0af27ba9cc4fe455e3381c75fc49a9326e2f17'
          'be09d29af3853825778331df451f16ca9e452d03')

backup=('etc/bitlbee/bitlbee.conf' 'etc/bitlbee/motd.txt' 'etc/xinetd.d/bitlbee')
install="bitlbee.install"
provides=('bitlbee')
conflicts=('bitlbee')

_bzrtrunk=http://code.bitlbee.org/bitlbee/
_bzrmod=bitlbee

build() {
	cd "$srcdir"
	msg "Connecting to Bazaar server...."

	if [[ -d "$_bzrmod" ]]; then
		cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
		msg "The local files are updated."
	else
		bzr --no-plugins branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
	fi

	msg "Bazaar checkout done or server timeout"
	msg "Starting build..."

	rm -rf "$srcdir/$_bzrmod-build"
	cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
	cd "$srcdir/$_bzrmod-build"

	./configure \
		--prefix=/usr \
		--etcdir=/etc/bitlbee \
		--pidfile=/var/run/bitlbee/bitlbee.pid \
		--ipcsocket=/var/run/bitlbee/bitlbee.sock \
		--systemdsystemunitdir=/usr/lib/systemd/system \
		--ssl=openssl \
		--strip=0 \
		--otr=plugin \
		--skype=plugin \

	make
}

package() {
	cd "$srcdir/$_bzrmod-build"

	install -Dm644 "${srcdir}"/xinetd "${pkgdir}"/etc/xinetd.d/bitlbee
	install -Dm755 "${srcdir}"/rc.d "${pkgdir}"/etc/rc.d/bitlbee

	make DESTDIR="${pkgdir}" install
	make DESTDIR="${pkgdir}" install-etc
	make DESTDIR="${pkgdir}" install-dev
}

# vim:set ts=2 sw=2 et:
