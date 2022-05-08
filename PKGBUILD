# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=diagnostic-languageserver
pkgver=1.14.2
pkgrel=1
pkgdesc="General purpose Language Server that integrates with linters to support diagnostic features"
arch=('any')
url="https://www.npmjs.com/package/diagnostic-languageserver"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('7a83cb6e2c928c15adc5c8dbb2ed149d0ce4da61ce30f260e08bc9ba0f5f562c')

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
