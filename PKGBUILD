# Maintainer: Nareg der Levonean <naregderlevonean@gmail.com>
pkgname=hyprmousetrap-git
pkgver=0 
pkgrel=1
pkgdesc="Hot-corner and edge-action daemon for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/naregderlevonean/hyprmousetrap"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'lua')
makedepends=('rust' 'cargo' 'git' 'pkgconf')
provides=('hyprmousetrap')
conflicts=('hyprmousetrap')

source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname%-git}"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname%-git}"
    cargo build --release --frozen
}

package() {
    cd "${pkgname%-git}"
    
    install -Dm755 "target/release/hyprmousetrap" "$pkgdir/usr/bin/hyprmousetrap"
    
    install -Dm644 "hyprmousetrap.lua" "$pkgdir/usr/share/hyprmousetrap/hyprmousetrap.lua"
    
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
