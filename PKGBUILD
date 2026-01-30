# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>
# Maintainer: Heddxh <g311571057 at gmail dot com>
# Contributor: Chewing_Bever

pkgname=fish-lsp-git
_pkgname=${pkgname%-git}
pkgver=1.1.3.r1.g48925a0
pkgrel=1
pkgdesc="LSP implementation for the fish shell language"
arch=('any')
url="https://github.com/ndonfris/fish-lsp/"
license=('MIT')
depends=('nodejs>=20.0.0')
makedepends=('git' 'yarn' 'fish')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://github.com/ndonfris/fish-lsp.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $pkgname
	export YARN_CACHE_FOLDER="$srcdir/yarn_cache"
	yarn install --frozen-lockfile --ignore-scripts
}

build() {
	cd $pkgname
	export YARN_CACHE_FOLDER="$srcdir/yarn_cache"
	yarn build
	./bin/fish-lsp complete >./fish-lsp.fish
}

package() {
	cd $pkgname
	install -Dm755 bin/fish-lsp -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 fish-lsp.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	install -Dm644 man/fish-lsp.1 -t "$pkgdir/usr/share/man/man1/"
}
