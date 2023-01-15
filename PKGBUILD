# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
pkgname=vsce
pkgver=2.15.0
pkgrel=2
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
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('df4dd4002ad13c4787d29f4ced37133970c89db04af1c9041ad14b279b2a722f')

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
