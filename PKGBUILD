# Maintainer: Insidious Fiddler <aur[at]codycody31[dot]dev>
pkgname=mermark-editor
pkgver=0.1.64
pkgrel=1
pkgdesc="Elegant and simple Markdown, Mermaid editor"
arch=('x86_64')
url="https://github.com/Vesperino/MerMarkEditor"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1')
makedepends=('rust' 'pnpm' 'nodejs' 'clang')
options=('!strip' '!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz" "mermark-editor.desktop")
sha256sums=('7f86943d6160ed6266f36407a513f56c1f77cd0c46aaa076ed7aab06f671a34c'
            'b53a303d9d44e96a7a371450aef5ee3002bb58abc8faf6346aa926aab2ec41ed')

# ci/cd flag: gh repo for auto updates
_ghrepo="Vesperino/MerMarkEditor"

prepare() {
    cd "$srcdir/MerMarkEditor-$pkgver"
    pnpm install --frozen-lockfile
}

build() {
    cd "$srcdir/MerMarkEditor-$pkgver"

    # Clean cargo cache to prevent ring crate linking issues
    cd src-tauri && cargo clean && cd ..

    # Set CC for ring crate's native code compilation
    export CC=clang

    pnpm tauri build --no-bundle
}

package() {
    cd "$srcdir/MerMarkEditor-$pkgver"
    install -Dm755 "src-tauri/target/release/mdreader" "$pkgdir/usr/bin/mermark-editor"
    install -Dm644 "$srcdir/mermark-editor.desktop" "$pkgdir/usr/share/applications/mermark-editor.desktop"
    install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/pixmaps/mermark-editor.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
