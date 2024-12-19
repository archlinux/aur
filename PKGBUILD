# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
pkgname=linutil-git
_pkgname=linutil
pkgver=2024.11.11.r7.g987f5da3
pkgrel=1
pkgdesc="Chris Titus Tech's Linutil is a distro-agnostic toolbox designed to simplify everyday Linux tasks."
arch=('x86_64' 'aarch64')
url="https://github.com/ChrisTitusTech/$_pkgname"
license=('MIT')
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
    echo "Version=$pkgver" >> "$_pkgname.desktop"
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
    install -Dm644 "man/$_pkgname.1" -t "$pkgdir/usr/share/man/man1"
    install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
