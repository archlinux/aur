# Maintainer: Yann Jorelle <yannjorelle@protonmail.com>
pkgname=krabby-git
_pkgname=krabby
_binname=krabby
pkgver=r18.824c45f
pkgrel=1
pkgdesc="Print pokemon sprites in your terminal"
url="https://github.com/yannjor/krabby"
license=("GPL-3.0")
arch=("any")
provides=("krabby")
conflicts=("krabby")
makedepends=("git" "rust" "cargo")
source=("git+https://github.com/yannjor/krabby.git")
sha256sums=("SKIP")

pkgver(){
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname" || exit 1
  # Build a release build
  cargo build --release
}

package() {
    cd "$_pkgname" || exit 1
    rm -rf "$pkgdir/usr/local/opt/$_pkgname"
    mkdir -p "$pkgdir/usr/local/opt/$_pkgname/colorscripts/regular"
    mkdir -p "$pkgdir/usr/local/opt/$_pkgname/colorscripts/shiny"
    mkdir -p "$pkgdir/usr/local/bin"
    install -Dm644 colorscripts/regular/* -t "$pkgdir/usr/local/opt/$_pkgname/colorscripts/regular"
    install -Dm644 colorscripts/shiny/* -t "$pkgdir/usr/local/opt/$_pkgname/colorscripts/shiny"
    install -Dm644 pokemon.json "$pkgdir/usr/local/opt/$_pkgname/pokemon.json"
    install -Dm755 target/release/krabby "$pkgdir/usr/local/opt/$_pkgname/$_binname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    # creating symlink in usr/local/bin
    ln -sf "/usr/local/opt/$_pkgname/krabby" "$pkgdir/usr/local/bin/$binname"
}
