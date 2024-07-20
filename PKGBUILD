# Maintainer: Heddxh <g311571057 at gmail dot com>
pkgname=fish-lsp-git
_pkgname=${pkgname%-git}
pkgver=r312.1cbeb37
pkgrel=1
pkgdesc="LSP implementation for the fish shell langauge"
arch=(any)
url="https://github.com/ndonfris/fish-lsp/"
license=('MIT')
depends=('fish')
makedepends=('git' 'yarn')
provides=(${_pkgname})
source=("${_pkgname}::git+https://github.com/ndonfris/fish-lsp.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$_pkgname"
    yarn install --ignore-scripts # Let's do it by ourselves
    yarn run compile
	./bin/fish-lsp complete > ./fish-lsp.fish # completion
}

package() {
	cd "$_pkgname"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm0644 "fish-lsp.fish" "$pkgdir/usr/share/fish/vendor_completions.d"
}
