# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nuclide-server
pkgver=0.0.32
pkgrel=1
pkgdesc="Server-side functionality required by Nuclide to support remote file editing."
arch=('i686' 'x86_64')
url="http://nuclide.io"
license=('CUSTOM')
depends=('nodejs' 'python2' 'watchman')
makedepends=('npm' 'git')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz
        LICENSE-$pkgver::https://github.com/facebook/nuclide/raw/v$pkgver/LICENSE
        homecache-$pkgver.diff::https://github.com/mtorromeo/nuclide/compare/v$pkgver...homecache.diff
        cafix-$pkgver.diff::https://github.com/mtorromeo/nuclide/compare/v$pkgver...cafix.diff)

prepare() {
	cd package
	sed 's|"ws": "0.7.1"|"ws": "0.8.0"|' -i package.json
	patch -p4 -i "$srcdir"/cafix-$pkgver.diff
	sed '1 s/env python$/env python2/' -i scripts/*.py
}

package() {
	PYTHON=python2 \
		npm install -g --user root --prefix "$pkgdir"/usr package

	install -Dm644 LICENSE-$pkgver "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	rm -rf "$pkgdir"/usr/etc
	chmod -R go-w "$pkgdir"
	find "$pkgdir" -type f -name package.json -exec chmod a-x {} \;

	cd "$pkgdir"/usr/lib/node_modules/nuclide-server/node_modules/nuclide-node-transpiler
	patch -p4 -i "$srcdir"/homecache-$pkgver.diff
	npm install --user root
}

sha256sums=('e06861f6102280d5abaed2caf12fa9f5147a80905d8b4d33c045e2d720f0c75d'
            '5c048a02821e17560bd70882074b3301c98ed3c03793ef1d030ebf1a50ac3355'
            '4dcd1e434f4fa3510e03033c32da623fb04c489cdcd9fd6977bb67f849ca3b3e'
            'c7e7339c32129d735a1713511e1f522a1cf822d105f4b7fee20c91380a9ae193')
