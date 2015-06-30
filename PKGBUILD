# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nuclide-server
pkgver=0.0.22
pkgrel=2
pkgdesc="Server-side functionality required by Nuclide to support remote file editing."
arch=('i686' 'x86_64')
url="http://nuclide.io"
license=('CUSTOM')
depends=('nodejs' 'python2' 'watchman')
makedepends=('npm' 'git')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz
        LICENSE-$pkgver::https://github.com/facebook/nuclide/raw/v$pkgver/LICENSE
        homecache.diff::https://github.com/facebook/nuclide/compare/master...mtorromeo:homecache.diff
        py_ssl_fix.diff::https://patch-diff.githubusercontent.com/raw/facebook/nuclide/pull/117.diff)
noextract=($pkgname-$pkgver.tgz)

package() {
	PYTHON=python2 \
		npm install -g --user root --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

	install -Dm644 LICENSE-$pkgver "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	rm -rf "$pkgdir"/usr/etc
	chmod -R go-w "$pkgdir"
	find "$pkgdir" -type f -name package.json -exec chmod a-x {} \;

	cd "$pkgdir"/usr/lib/node_modules/nuclide-server

  patch -p4 -i "$srcdir"/py_ssl_fix.diff
	sed '1 s/env python$/env python2/' -i scripts/*.py

	cd node_modules/nuclide-node-transpiler
	patch -p4 -i "$srcdir"/homecache.diff
	npm install --user root
}

sha256sums=('699c271e2a1cfae5beb2c85ab31b3eaeb43954ded4137e06fc1eb5090139d87b'
            '5c048a02821e17560bd70882074b3301c98ed3c03793ef1d030ebf1a50ac3355'
            '90075dd2f0dd57fdbe2866c63b0a6d306f5254a2f477b732ec12eac76ea922c5'
            '559ffee562b5168dc62faba61e6493053e11653ccde651f5598081e8778c733b')
