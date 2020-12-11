# Maintainer: Ilango Rajagopal <ilangokul@gmail.com>

pkgname=vscode-html-languageserver
_parent=vscode
pkgver=1.51.1
pkgrel=1
pkgdesc="HTML Language server from vscode"
arch=(any)
url="https://github.com/Microsoft/vscode/tree/master/extensions/html-language-features/server"
license=('custom')
depends=(nodejs)
makedepends=(typescript npm)
source=("$_parent-$pkgver.tar.gz::https://github.com/microsoft/vscode/archive/$pkgver.tar.gz"
	"vscode-html-languageserver")
sha256sums=("3a7127983fac7c8e44b5b26b026341b8fd91c65ff34a4664e65ae43ae358d31b" "SKIP")

prepare() {
	cd "$_parent-$pkgver/extensions/html-language-features/server"

	# Version will always be 1.0.0, patch it to $pkgver
	sed -iE -e "s/\(\s*version\":\s*\"\)1.0.0/\1$pkgver/" package.json
}

build() {
	cd "$_parent-$pkgver/extensions/html-language-features/server"
	tsc || true
}

package() {
	cd "$_parent-$pkgver/extensions/html-language-features/server"
	cd out
	cp ../package.json .
	npm pack
	npm install -g --user root --prefix "${pkgdir}/usr" "$pkgname-$pkgver.tgz"
	
	# Non-deterministic race in npm gives 777 permissions to random directories.
	# See https://github.com/npm/cli/issues/1103 for details.
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +

	# npm gives ownership of ALL FILES to build user
	# https://bugs.archlinux.org/task/63396
	chown -R root:root "${pkgdir}" 

	# Package the runner
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/vscode-html-languageserver" "${pkgdir}/usr/bin/"

	# License
	mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
	cp "${srcdir}/$_parent-$pkgver/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/"
}
