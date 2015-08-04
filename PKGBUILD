# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nuclide-server
pkgver=0.0.26
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
noextract=($pkgname-$pkgver.tgz)

package() {
	PYTHON=python2 \
		npm install -g --user root --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

	install -Dm644 LICENSE-$pkgver "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	rm -rf "$pkgdir"/usr/etc
	chmod -R go-w "$pkgdir"
	find "$pkgdir" -type f -name package.json -exec chmod a-x {} \;

	cd "$pkgdir"/usr/lib/node_modules/nuclide-server

	patch -p4 -i "$srcdir"/cafix-$pkgver.diff
	sed '1 s/env python$/env python2/' -i scripts/*.py

	cd node_modules/nuclide-node-transpiler
	patch -p4 -i "$srcdir"/homecache-$pkgver.diff
	npm install --user root
}

sha256sums=('f55cda7e3838e6b25caeede06dee2c4ce117493b4bbe4cd1b4dd3baa1ea8d7bf'
            '5c048a02821e17560bd70882074b3301c98ed3c03793ef1d030ebf1a50ac3355'
            'bd05ed2d4989772b3fd39e83408709961c998852930a6882c4862aea40f969a3'
            'c7e7339c32129d735a1713511e1f522a1cf822d105f4b7fee20c91380a9ae193')
