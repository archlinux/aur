# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nuclide-server
pkgver=0.0.35
pkgrel=1
pkgdesc="Server-side functionality required by Nuclide to support remote file editing."
arch=('i686' 'x86_64')
url="http://nuclide.io"
license=('CUSTOM')
depends=('nodejs' 'python2' 'watchman')
makedepends=('npm' 'git')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz
        LICENSE-$pkgver::https://github.com/facebook/nuclide/raw/v$pkgver/LICENSE
        homecache-$pkgver.diff::https://github.com/mtorromeo/nuclide/compare/v$pkgver...homecache.diff)

prepare() {
	cd package
	sed 's|"ws": "0.7.1"|"ws": "0.8.0"|' -i package.json
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

sha256sums=('21f2e41a9709f6e48de733bd526ec89fa190063b71207ee264337dff96cbf21f'
            '5c048a02821e17560bd70882074b3301c98ed3c03793ef1d030ebf1a50ac3355'
            '2c7936dbc4a37a259d2d4678f8cd707432637ae150c2bfbbf605096b35903d1f')
