# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname="linutil"
pkgver=2024.09.28
pkgrel=3
pkgdesc="Chris Titus Tech's Linutil is a distro-agnostic toolbox designed to simplify everyday Linux tasks."
arch=('x86_64' 'aarch64')
url="https://github.com/ChrisTitusTech/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChrisTitusTech/$pkgname/archive/refs/tags/$pkgver.tar.gz"
    "https://raw.githubusercontent.com/ChrisTitusTech/$pkgname/refs/heads/main/$pkgname.desktop"
    "https://raw.githubusercontent.com/ChrisTitusTech/$pkgname/refs/heads/main/man/$pkgname.1") # REMOVE THIS WITH THE NEXT RELEASE
sha256sums=('f618ff87a4ce9b18c10e1c35b60e1bfc59c95826f75b49e5eeac8ae5b4672940' 'SKIP' 'SKIP')
makedepends=('rustup' 'glibc' 'gcc-libs')
depends=('git' 'pacman' 'tree-sitter' 'tree-sitter-bash')
optdepends=('ttf-nerd-fonts-symbols: symbols and icons')

prepare() {
    echo "Version=$pkgver" >> "$pkgname.desktop"

    export RUSTUP_TOOLCHAIN=stable

    cd "$pkgname-$pkgver"

    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C link-arg=/usr/lib/libtree-sitter.so -C link-arg=/usr/lib/libtree-sitter-bash.so"

    cd "$pkgname-$pkgver"

    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 "$srcdir/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
