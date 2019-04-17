# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=dindent
pkgver=2.3.0
pkgrel=1
pkgdesc='PHP library and CLI for indenting HTML for development and testing.'
arch=(any)
url="https://github.com/gajus/$pkgname"
license=(BSD)
depends=(php)
makedepends=(composer)
source=("$pkgname-.tar.gz::https://github.com/gajus/dindent/archive/$pkgver.tar.gz")
sha256sums=('bd4203bb1a89b6d49d4c2d56a20a4d80f19833986bb5e6f44c6437cc1b3f1222')

build() {
	cd "$pkgname-$pkgver"
	sed -i \
		-e 's|vendor/autoload\.php|src/Indenter\.php|' \
		-e 's|\./dindent\.php|dindent|' \
		-e "s|error('\"input\" file does not exist.');||" \
		bin/dindent.php
	cat >dindent <<-EOF
	#!/bin/sh
	exec php /usr/share/dindent/bin/dindent.php "\$@"
	EOF
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bin/dindent.php "$pkgdir/usr/share/dindent/bin/dindent.php"
	find src -type f -exec install -Dm644 {} "$pkgdir/usr/share/dindent/{}" \;
	install -Dm755 dindent "$pkgdir/usr/bin/dindent"
}
