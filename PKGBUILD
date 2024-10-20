# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Maintainer: Heddxh <g311571057 at gmail dot com>
# Contributor: Chewing_Bever
pkgname=fish-lsp-git
_pkgname=${pkgname%-git}
pkgver=r318.ed156da
pkgrel=1
pkgdesc="LSP implementation for the fish shell language"
# tree-sitter contains compiled files
arch=('x86_64')
url="https://github.com/ndonfris/fish-lsp/"
license=('MIT')
depends=('fish' 'nodejs' 'python')
makedepends=('git' 'yarn' 'typescript')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://github.com/ndonfris/fish-lsp.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$pkgname"
    yarn --frozen-lockfile --ignore-scripts
}

build() {
    cd "$pkgname"
    tsc
    ./bin/fish-lsp complete >./fish-lsp.fish
}

package() {
    cd "$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/lib/node_modules/fish-lsp"

    rm -r node_modules/@types
    cp -r node_modules out package.json fish_files "$pkgdir/usr/lib/node_modules/fish-lsp"
    # nvim-lspconfig doesn’t work without this symlink
    ln -s /usr/lib/node_modules/fish-lsp/node_modules/@esdmr/tree-sitter-fish/tree-sitter-fish.wasm \
        "$pkgdir/usr/lib/node_modules/fish-lsp/"

    printf "%s\n" "#!/usr/bin/env node" "require('/usr/lib/node_modules/fish-lsp/out/cli');" >"$pkgdir/usr/bin/fish-lsp"
    chmod 755 "$pkgdir/usr/bin/fish-lsp"

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "fish-lsp.fish" "$pkgdir/usr/share/fish/vendor_completions.d/fish-lsp.fish"
}
