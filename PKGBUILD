# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dibblethewrecker dtw.at.jiwe.dot.org

pkgname=checkgmail
pkgver=1.13
pkgrel=8
pkgdesc="An alternative Gmail Notifier for Linux and other *nix systems"
arch=('any')
url="http://checkgmail.sourceforge.net"
license=('GPL')
depends=('perl-gtk2-trayicon' 'perl-lwp-protocol-https' 'perl-xml-simple' 'perl-freezethaw' 'perl-crypt-simple' 'perl-crypt-blowfish')
makedepends=('gendesk')
optdepends=('perl-gtk2-sexy')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.bz2
	'svn-47.patch'
	'use-lwp-protocol-https.patch'
	'galx.patch')
md5sums=('8f6742ba9c09f7b7b23a5be2e14708c7'
         'c1becb0773ed31cf9ae4dd7686854e0e'
         'e4dd95e461b2111808df8816b9f667e1'
         '0c3d643abf932577122249303a6aad05')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}

	for p in svn-47 use-lwp-protocol-https galx
	do
		msg2 "Applying $p.patch..."
		patch -Np1 <"$srcdir/$p.patch"
	done
	sed -i 's|www.google.com/accounts|accounts.google.com|' checkgmail
	gendesk --pkgname=$pkgname --pkgdesc='Checks a Gmail account for new mail' \
		--categories='Network;Email'
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	install -D -m 755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
	install -D -m 644 man/${pkgname}.1.gz \
		${pkgdir}/usr/share/man/man1/${pkgname}.1.gz

	# freedesktop
	install -D -m 644 ${pkgname}.desktop \
		${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -D -m 644 ${pkgname}.png \
		${pkgdir}/usr/share/pixmaps/${pkgname}.png
}
