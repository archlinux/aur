#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-themis
pkgver=1.7.0
pkgrel=1
pkgdesc="Vim script testing framework"
arch=('any')
url="https://github.com/thinca/vim-themis"
license=('zlib')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
checkdepends=('vim')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b45cfdf5b3f2a728d14f1409dbe1095a6cb46af8a7e8472ebf20899f0c12eb19')

check() {
	cd "$pkgname-$pkgver"
	./bin/themis test
}

package() {
	cd "$pkgname-$pkgver"
	find autoload doc ftdetect ftplugin indent macros syntax \
		-type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
	install -D bin/themis -t "$pkgdir/usr/share/vim/vimfiles/bin/"
	install -d "$pkgdir/usr/bin/"
	ln -s /usr/share/vim/vimfiles/bin/themis "$pkgdir/usr/bin/"
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
