# Maintainer: Noam Lewis
#
# Source package - builds from source

pkgname=fresh-editor
pkgver=0.1.70
pkgrel=1
pkgdesc="A lightweight, fast terminal-based text editor with LSP support and TypeScript plugins"
url="https://sinelaw.github.io/fresh/"
license=("GPL-2.0-only")
arch=("x86_64")
depends=("gcc-libs" "glibc")
makedepends=("cargo" "clang")
provides=("fresh-editor")
conflicts=("fresh-editor-bin")
options=('!debug')
source=("fresh-editor-${pkgver}-source.tar.gz::https://github.com/sinelaw/fresh/releases/download/v${pkgver}/fresh-editor-${pkgver}-source.tar.gz")
sha256sums=("3c2435c195ebaf377161c17c1374a4daf06f2b02b248c986a758149fa969e1b3")

prepare() {
    cd "fresh-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "fresh-$pkgver"
    export CARGO_TARGET_DIR=target
    export CC=clang
    cargo build --frozen --release
}

package() {
    cd "fresh-$pkgver"

    # Binary (installed alongside plugins, symlinked from /usr/bin)
    install -Dm755 target/release/fresh "$pkgdir/usr/share/$pkgname/fresh"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/usr/share/$pkgname/fresh" "$pkgdir/usr/bin/fresh"

    # Documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Plugins
    cp -r plugins "$pkgdir/usr/share/$pkgname/"

    # Keymaps
    cp -r keymaps "$pkgdir/usr/share/$pkgname/"
}
