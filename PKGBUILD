# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=seetui-git
_pkgname=seetui
pkgver=0.1.5.r2.g45feef6
pkgrel=1
pkgdesc='see (Service Event Extraction) is a TUI based tool to lookup logs from services (systemd)'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/NustyFrozen/SEE'
license=('GPL-3.0')
makedepends=('cargo' 'git')
provides=('seetui')
conflicts=('seetui')
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
    install -Dm0755 'target/release/seetui' "$pkgdir/usr/bin/seetui"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=4 sw=4 et:
