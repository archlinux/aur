# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=alex
pkgname=alexjs
pkgver=8.0.1
pkgrel=1
pkgdesc="Catch insensitive, inconsiderate writing"
arch=('any')
url="https://alexjs.com"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz")
sha256sums=('0a64c66e15fecf8e9cfc9e456ca2efd5c700cd806c38a02c4ae65f02b5073baa')

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
