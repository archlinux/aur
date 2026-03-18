# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=llmfit-git
_pkgname=llmfit
pkgver=0.7.5.r2.g9e7ac95
pkgrel=1
pkgdesc='Hundreds of models & providers. One command to find what runs on your hardware.'
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64')
url='https://github.com/AlexsJones/llmfit'
license=('MIT')
makedepends=('cargo')
options=(!lto)
provides=('llmfit')
conflicts=('llmfit' 'llmfit-bin')
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t ${pkgdir}/usr/bin 'target/release/llmfit'
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
