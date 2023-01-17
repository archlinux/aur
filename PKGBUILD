# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kirill Goncharov <kdgoncharov at gmail dot com>
# Contributor:  Devin Cofer <ranguvar[at]ranguvar[dot]io>
# Contributor: Francisco Giordano <frangio.1@gmail.com>

pkgname=truffle
pkgver=5.7.3
pkgrel=1
pkgdesc='Development framework for Ethereum smart contracts'
url='https://github.com/trufflesuite/truffle'
arch=('x86_64')
options=(!strip)
license=('MIT')
depends=('nodejs')
makedepends=('npm')
noextract=("$pkgname-$pkgver.tgz")
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('7faa8c5a8b6861bcfe5cb0821f328f5f228bf63c923817a755b6fc05c498a716')

package() {
	npm install -g --production --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$pkgname-$pkgver.tgz"
	tar -xf "truffle-${pkgver}.tgz" package/LICENSE
	install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# -> https://wiki.archlinux.org/index.php/Node.js_package_guidelines
	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"
}
