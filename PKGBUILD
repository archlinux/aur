# Maintainer :  Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)


pkgname=joomscan-git
pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --tags | sed 's:-:\+:g'
}
pkgver=0.0.7+27+g4192949
pkgrel=2

pkgdesc='OWASP Joomla! security scanner'
arch=('any')
url='https://www.owasp.org/index.php/Category:OWASP_Joomla_Vulnerability_Scanner_Project'
license=('GPL3')

depends=('perl')
makedepends=('git' 'rsync')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

changelog='CHANGELOG'
source=("git+https://github.com/rezasp/${pkgname%-git}")

sha256sums=('SKIP')

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 -t "$pkgdir/usr/lib/${pkgname%-git}/" "${pkgname%-git}".pl
	rsync -rpt core exploit modules "$pkgdir/usr/lib/${pkgname%-git}/"
	install -Dm644 -t "$pkgdir/usr/share/doc/${pkgname%-git}/" *.md Dockerfile
	install -dm755 "$pkgdir/usr/bin"
	#ln -Ts "/usr/lib/${pkgname%-git}/${pkgname%-git}.pl" "$pkgdir/usr/bin/${pkgname%-git}"
	cat >"$pkgdir/usr/bin/${pkgname%-git}" <<-EOT
		#!/bin/sh

		/usr/bin/perl "/usr/lib/${pkgname%-git}/${pkgname%-git}.pl"
	EOT
	chmod 755 "$pkgdir/usr/bin/${pkgname%-git}"
}


# vim: ts=4 sw=4 noet ft=PKGBUILD:
