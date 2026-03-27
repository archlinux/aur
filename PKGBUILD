# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=darya-git
_pkgname=darya
pkgver=0.1.5.r1.g1f70c99
pkgrel=1
pkgdesc=' Disk usage explorer with a TUI and live treemap'
arch=('x86_64' 'aarch64')
url='https://github.com/mrkatebzadeh/darya'
license=('MIT')
makedepends=('cargo' 'git')
provides=('darya')
conflicts=('darya' 'darya-bin')
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm0755 target/release/darya "$pkgdir/usr/bin/darya"
    install -Dm644 LICENSE-3.0 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
