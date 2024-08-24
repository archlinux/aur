# Maintainer: Martino Pilia <martino.pilia@gmail.com>
pkgname=vsce
pkgver=3.0.0
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
sha256sums=('10801848902f193810367f83d72d801655d74c906f841ae4afa38536e74c549b')

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
