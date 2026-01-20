# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=hygg
pkgver=0.1.19
pkgrel=1
pkgdesc='Minimalistic Vim-like TUI document reader.'
arch=('x86_64')
url='https://github.com/kruseio/hygg'
license=('AGPL-3.0')
makedepends=('cargo') # 'clang' 'gcc-libs')
options=(!lto)
provides=($pkgname 'cli-epub-to-text' 'cli-justify' 'cli-pdf-to-text' 'cli-text-reader')
conflicts=($pkgname-git $pkgname-bin)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
    "$pkgname-$pkgver.tar.gz.asc")
sha256sums=('36491747e9d47cf7d24ae0666fd2908535eac437e8223a6bd88465a90e1cf35a'
            'SKIP')
validgpgkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # fix the naitive linking errors
    # export RUSTFLAGS="-Clinker-plugin-lto"
    #RUSTFLAGS="-Clinker-plugin-lto -Clinker=clang -Clink-arg=-fuse-ld=lld"
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[0]}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[1]}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[2]}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[3]}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${provides[4]}"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/README.md" README.md

}

