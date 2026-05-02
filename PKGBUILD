# Maintainer: gilcu3
# Previous Maintainer: Martino Pilia <martino.pilia@gmail.com>
# Contributor: Martino Pilia <martino.pilia@gmail.com>
pkgname=vsce
pkgver=3.9.2
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
# source=("${pkgname}-v${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
source=("${pkgname}-v${pkgver}.tar.gz::https://registry.npmjs.org/@vscode/${pkgname}/-/${pkgname}-${pkgver}-1.tgz")
options=('!strip')
sha256sums=('95086af81712e4527a70ff6ba92638485dd59a8a3f16ddc8d9cc6516d589ec82')

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
		"${srcdir}/package/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
