# Maintainer: Martino Pilia <martino.pilia@gmail.com>
pkgname=vsce
pkgver=2.22.0
pkgrel=1
pkgdesc="Visual Studio Code extension manager"
arch=('any')
url="https://github.com/Microsoft/vscode-vsce"
license=('MIT')
depends=('nodejs')
makedepends=(
	'npm'
	'typescript'
    'yarn'
)
source=("https://registry.npmjs.org/@vscode/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('0d497e0d955ce9d4d8c41df6231139d74a50f8eb72be07af6547912e0690c106')

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
