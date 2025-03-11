# Maintainer: gilcu3
# Previous Maintainer: Martino Pilia <martino.pilia@gmail.com>
# Contributor: Martino Pilia <martino.pilia@gmail.com>
pkgname=vsce
pkgver=3.2.2
pkgrel=2
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
source=("${pkgname}-v${pkgver}.tar.gz::https://registry.npmjs.org/@vscode/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('c64c08c922ce0a093ec7ac3d0bf9951f46cdca4ea0241d66c3e0b14fca8c645a')

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
