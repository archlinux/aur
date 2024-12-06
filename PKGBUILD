# Maintainer: Martino Pilia <martino.pilia@gmail.com>
pkgname=vsce
pkgver=3.2.1
pkgrel=1
pkgdesc="Visual Studio Code extension manager"
arch=('any')
url="https://github.com/Microsoft/vscode-vsce"
license=('MIT')
depends=(
    'nodejs'
	'npm'
)
makedepends=(
	'typescript'
    'yarn'
)
source=("https://registry.npmjs.org/@vscode/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('3b2170323ab09b66588dc4d43b7046b7b4cfab25502b6831e259e88adad427cb')

package() {
	npm install -g \
		--prefix "${pkgdir}"/usr \
		"${srcdir}"/${pkgname}-${pkgver}.tgz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/cli/issues/1103 for details.
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +

	# Fix ownership
	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"

	install -D -m644 \
		"${srcdir}/package/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
