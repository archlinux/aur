# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=hygg-git
_pkgname=${pkgname%-git}
pkgver=0.1.19.r6.g0523a2b
pkgrel=2
pkgdesc='Minimalistic Vim-like TUI document reader - From the main branch'
arch=('x86_64')
url='https://github.com/kruseio/hygg'
license=('AGPL-3.0')
makedepends=('cargo' 'git') # 'clang' 'gcc-libs')
options=(!lto)
provides=($_pkgname 'cli-epub-to-text' 'cli-justify' 'cli-pdf-to-text' 'cli-text-reader')
conflicts=($_pkgname $_pkgname-bin)
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[0]}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[1]}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[2]}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[3]}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[4]}"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

