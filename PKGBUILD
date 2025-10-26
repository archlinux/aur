# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>
# Maintainer: Heddxh <g311571057 at gmail dot com>
# Contributor: Chewing_Bever

pkgname=fish-lsp-git
_pkgname=${pkgname%-git}
pkgver=r381.cc77cf3
pkgrel=1
pkgdesc="LSP implementation for the fish shell language"
arch=('any')
url="https://github.com/ndonfris/fish-lsp/"
license=('MIT')
depends=('nodejs>=20.0.0')
makedepends=('git' 'yarn' 'fish' 'npm')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://github.com/ndonfris/fish-lsp.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd $pkgname
    export YARN_CACHE_FOLDER="$srcdir/yarn_cache"
    yarn install --frozen-lockfile --ignore-scripts
    yarn build --binary
	./bin/fish-lsp complete >./fish-lsp.fish
}

package() {
	cd $pkgname
	install -Dm755 bin/fish-lsp -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 fish-lsp.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	install -Dm644 man/fish-lsp.1 -t "$pkgdir/usr/share/man/man1/"
}
