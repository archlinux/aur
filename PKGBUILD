# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
# https://github.com/harilvfs

pkgname=mcfetch-git
_pkgname=mcfetch
pkgver=0.1.0.r18.gecd4d11
pkgrel=1
pkgdesc="Lightweight fetching program with color options."
arch=(any)
url="https://github.com/dybdeskarphet/$_pkgname"
license=('GPL')
source=("git+$url")
sha256sums=('SKIP')
makedepends=('cargo')
depends=('git' 'pacman' 'tree-sitter' 'tree-sitter-bash' 'gcc-libs')
optdepends=('ttf-nerd-fonts-symbols: symbols and icons')
conflicts=("$_pkgname")
provides=("$_pkgname")

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C link-arg=/usr/lib/libtree-sitter.so -C link-arg=/usr/lib/libtree-sitter-bash.so"
    cd "$_pkgname"
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname"
    install -Dm0755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}

