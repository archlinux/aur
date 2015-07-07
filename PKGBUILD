# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nuclide-server
pkgver=0.0.24
pkgrel=1
pkgdesc="Server-side functionality required by Nuclide to support remote file editing."
arch=('i686' 'x86_64')
url="http://nuclide.io"
license=('CUSTOM')
depends=('nodejs' 'python2' 'watchman')
makedepends=('npm' 'git')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz
        LICENSE-$pkgver::https://github.com/facebook/nuclide/raw/v$pkgver/LICENSE
        homecache.diff::https://github.com/facebook/nuclide/compare/master...mtorromeo:homecache.diff
        cafix.diff::https://patch-diff.githubusercontent.com/raw/facebook/nuclide/pull/132.diff)
noextract=($pkgname-$pkgver.tgz)

package() {
	PYTHON=python2 \
		npm install -g --user root --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

	install -Dm644 LICENSE-$pkgver "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	rm -rf "$pkgdir"/usr/etc
	chmod -R go-w "$pkgdir"
	find "$pkgdir" -type f -name package.json -exec chmod a-x {} \;

	cd "$pkgdir"/usr/lib/node_modules/nuclide-server

  patch -p4 -i "$srcdir"/cafix.diff
	sed '1 s/env python$/env python2/' -i scripts/*.py

	cd node_modules/nuclide-node-transpiler
	# patch -p4 -i "$srcdir"/homecache.diff
	npm install --user root
}

sha256sums=('c99ff58a025cb42f2ec93aff94246954987cf74ccf7328569213bbff9c006810'
            '5c048a02821e17560bd70882074b3301c98ed3c03793ef1d030ebf1a50ac3355'
            '4198d5c204b72082b078158bcdda0eaff23aa74605a9c091c8162d3d2b4452b0'
            'b80d1a8f2536655a6c558d25ada2c285f00654e8d6b021b72488d2d47347a475')
