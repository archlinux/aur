# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kirill Goncharov <kdgoncharov at gmail dot com>
# Contributor:  Devin Cofer <ranguvar[at]ranguvar[dot]io>
# Contributor: Francisco Giordano <frangio.1@gmail.com>

pkgname=truffle
pkgver=5.11.5
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
sha256sums=('bbc24698fc9964cd80acc8952500f708ef18984096eba9e75f40db3486392347')

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
