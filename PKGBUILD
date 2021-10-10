# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
_name=generator-code
pkgname=nodejs-generator-code
pkgver=1.6.2
pkgrel=1
pkgdesc="Visual Studio Code extension generator"
arch=('any')
url="https://github.com/Microsoft/vscode-generator-code"
license=('MIT')
depends=('nodejs-yeoman')
makedepends=('npm')
source=("https://registry.npmjs.org/$_name/-/$_name-$pkgver.tgz")
sha256sums=('cb16863fbf35080702a19a227a1badff7184be7f147675ebd8f62b58a4166c00')

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
