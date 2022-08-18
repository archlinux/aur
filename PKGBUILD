# Maintainer: Iván Zaera Avellón <ivan dot zaera at protonmail dot com>
pkgname=bautista
pkgdesc="A domotic butler bot"
pkgver=0.0.1
pkgrel=1
arch=('any')
url="https://github.com/joshi-stuff/bautista"
license=('GPL3')
depends=(
	'nodejs'
)
makedepends=(
	'coreutils'
	'npm'
)
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/joshi-stuff/bautista/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=("a8f5eb43a9ec4566ee4410647dfdc90769e1b5160bb661e083dcaccef19f875b")

build() {
	cd "$srcdir/$pkgname-$pkgver"

	npm install
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p $pkgdir/etc/bautista
	cat >$pkgdir/etc/bautista.json <<EOF
{
	"control": {
		"period": 58000
	},
	"devices": {
		"Pruebas": {
			"controlled": true,
			"rules": {
				"hoursOn": 3,
				"consecutive": true
			}
		}
	},
	"meross": {
		"user": "***",
		"password": "***"
	},
	"telegram": {
		"token": "***",
		"allowedUsers": [
			"***"
		]
	}
}
EOF

	mkdir -p $pkgdir/usr/bin
	cat >$pkgdir/usr/bin/bautista <<EOF
#!/bin/sh
node /usr/lib/bautista/index.js
EOF
	chmod +x $pkgdir/usr/bin/bautista

	mkdir -p $pkgdir/usr/lib/bautista
	cp -r * $pkgdir/usr/lib/bautista
	rm $pkgdir/usr/lib/bautista/package.json
	rm $pkgdir/usr/lib/bautista/package-lock.json
	rm $pkgdir/usr/lib/bautista/yarn.lock
}
