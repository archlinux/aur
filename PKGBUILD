# Maintainer: quest <quest at mac dot com>

pkgname=cashc
pkgver=0.10.0
pkgrel=1
pkgdesc='CashScript compiler for Bitcoin Cash.'
url='https://github.com/CashScript/cashscript'
arch=('x86_64')
options=(!strip)
license=('MIT')
depends=('nodejs')
makedepends=('npm')
noextract=("$pkgname-$pkgver.tgz")
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('f64287e9d6db70c7333428a42895d859c7fb97a0eefc94d4cf166568622b1f5d')

package() {
	npm install -g --omit="dev" --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$pkgname-$pkgver.tgz"
	tar -xf "${pkgname}-${pkgver}.tgz" package/LICENSE
	install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# -> https://wiki.archlinux.org/index.php/Node.js_package_guidelines
	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "$pkgdir/usr" -type d -exec chmod 755 {} +

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "$pkgdir"
}
