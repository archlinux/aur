# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=alex
pkgname=alexjs
pkgver=11.0.0
pkgrel=1
pkgdesc="Catch insensitive, inconsiderate writing"
arch=('any')
url="https://alexjs.com"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz")
sha256sums=('8c95ed589538bf77330690dc5d3c812b6c7d25f5c3ac731b54d605871b5a1b23')

package() {
	npm install -g \
		--user root \
		--prefix "$pkgdir"/usr \
		"$srcdir"/$_name-$pkgver.tgz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/npm/issues/9359 for details.
	find "${pkgdir}"/usr -type d -exec chmod 755 {} +

	# Solve conflict with the alex package (Haskell lexer generator)
	# https://github.com/get-alex/alex/issues/83
	mv "${pkgdir}"/usr/bin/alex "${pkgdir}"/usr/bin/alexjs

	install -D -m644 \
		"${srcdir}/package/license" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
