# Creator: Martino Pilia <martino.pilia@gmail.com>
# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>
pkgname=diagnostic-languageserver
pkgver=1.15.0
pkgrel=1
pkgdesc="General purpose Language Server that integrates with linters to support diagnostic features"
arch=('any')
url="https://www.npmjs.com/package/diagnostic-languageserver"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
b2sums=('fe8b6d46b2b713cf87637abd7173d42e9cfce89c1d397b2815be888f12b36c06')

package() {
	npm install -g \
		--prefix "$pkgdir"/usr \
		"$srcdir"/$pkgname-$pkgver.tgz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/cli/issues/1103 for details.
	find "${pkgdir}"/usr -type d -exec chmod 755 {} +

	# Fix ownership
	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"

	install -D -m644 \
		"${srcdir}/package/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
