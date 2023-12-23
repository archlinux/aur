# Maintainer: Martino Pilia <martino.pilia@gmail.com>
_name=generator-code
pkgname=nodejs-generator-code
pkgver=1.8.2
pkgrel=1
pkgdesc="Visual Studio Code extension generator"
arch=('any')
url="https://github.com/Microsoft/vscode-generator-code"
license=('MIT')
depends=('nodejs-yeoman')
makedepends=('npm')
source=("https://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz")
sha256sums=('eb2cc67413ab43c0268eed35ccab8800a435bba23682d129bda0cff0c1dab59d')

package() {
	npm install -g \
		--prefix "$pkgdir"/usr \
		"$srcdir"/$_name-$pkgver.tgz

	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/cli/issues/1103 for details.
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}"

	install -D -m644 \
		"${srcdir}/package/LICENSE" \
		"${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
