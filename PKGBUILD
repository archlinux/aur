# Maintainer: gilcu3
# Previous Maintainer: Martino Pilia <martino.pilia@gmail.com>
# Contributor: Martino Pilia <martino.pilia@gmail.com>
pkgname=vsce
pkgver=3.2.2
pkgrel=1
pkgdesc="Visual Studio Code extension manager"
arch=('any')
url="https://github.com/microsoft/vscode-vsce"
license=('MIT')
depends=(
    'nodejs'
	'npm'
)
makedepends=(
	'typescript'
    'yarn'
)
source=("${pkgname}-v${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# source=("https://registry.npmjs.org/@vscode/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('5ea9d9d5d160f310fc88c3470f11e975ef0c76728ab3eb17eb1bab01a2a0ef7b')

package() {
	npm install -g \
		--prefix "${pkgdir}"/usr \
		"${srcdir}"/${pkgname}-v${pkgver}.tar.gz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/cli/issues/1103 for details.
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +

	# Fix ownership
	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"

	install -D -m644 \
		"${srcdir}/vscode-${pkgname}-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
