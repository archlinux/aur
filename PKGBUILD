# Contributor: Splex
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Jérémie Astor <astor.jeremie@wanadoo.fr>
# Contributor: Cyrille Laloy <dev at tukoz dot it>

_pkgname=xombrero
pkgname=xombrero-gtk2-git
pkgver=1.6.4.7.g28d1406
pkgrel=1
pkgdesc="Minimalist web browser - gtk2 version"
arch=('i686' 'x86_64')
url="https://github.com/conformal/xombrero/wiki"
license=('custom:ISC')
depends=('webkitgtk2' 'libbsd' 'desktop-file-utils')
makedepends=('git')
provides=('xombrero')
conflicts=('xxxterm' 'xombrero' 'xombrero3' 'xombrero-git')
source=('git+https://github.com/conformal/xombrero.git'
        'LICENSE')
md5sums=('SKIP'
         'f3eeb6e8b70a3dcccb8ee57daf584c9e')


pkgver() {
	cd "$srcdir/$_pkgname/"
	git describe --always | sed -e 's|-|.|g' -e 's|XOMBRERO_||' -e 's|_|.|g'
}

prepare() {
	cd "$srcdir/$_pkgname/"
	sed -i 's|/etc/ssl/cert.pem|/etc/ssl/certs/ca-certificates.crt|' xombrero.conf
	sed -i 's|https://www.cyphertite.com|http://archlinux.org|' xombrero.{c,conf,h}
	sed -i 's|/usr/local|/usr|' xombrero.{h,conf}
	cd "linux"
	sed -i 's|LIBS= gtk+-2.0|& javascriptcoregtk-1.0|' Makefile
	sed -i 's/gnutls/& libbsd/' Makefile
}

build() {
	cd "$srcdir/$_pkgname/"
	make PREFIX="/usr" -C linux GTK_VERSION=gtk2
}

package() {
	cd "$srcdir/$_pkgname/"
	make PREFIX="/usr" DESTDIR="$pkgdir" install -C linux GTK-VERSION=gtk2
	install -Dm644 xombrero.conf "$pkgdir/etc/skel/xombrero.conf"
	install -Dm644 xombrero.desktop  "$pkgdir/usr/share/applications/xombrero.desktop"
	install -Dm755 config-checker.pl "$pkgdir/usr/bin/config-checker.pl"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
