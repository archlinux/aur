# Maintainer: quest <quest at mac dot com>

pkgname=cashc
pkgver=0.13.3
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
sha256sums=('1d1c8f8951f32777a4c832cf0c7d0cc618b0c751c2a1d1a2e84987733ed5e276')

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
