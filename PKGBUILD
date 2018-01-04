# Maintainer: jD91mZM2 <me@krake.one>
pkgname="synac-gtk-git"
pkgver=r102.5ec8d10
pkgrel=1
pkgdesc="The synac GTK+ client"
url="https://github.com/synac-chat/client-gtk"
arch=("x86_64")
license=("MIT", "custom:MIT")
makedepends=("git" "rust")
optdepends=()
depends=()
source=(
    "$pkgname::git+https://github.com/synac-chat/client-gtk"
    "pulldown-cmark-patch::git+https://github.com/synac-chat/pulldown-cmark"
)
sha256sums=("SKIP" "SKIP")

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule init
    git config submodule.pulldown-cmark-patch.url "$srcdir/pulldown-cmark-patch"
    git submodule update
}
build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}
package() {
    cd "$srcdir/$pkgname"
    install -Dm 755 "target/release/client-gtk" "$pkgdir/usr/bin/synac-gtk"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
