# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=gitpane
pkgver=0.7.2
pkgrel=1
pkgdesc='Multi-repo Git workspace dashboard for the terminal'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/affromero/gitpane'
license=('MIT')
depends=('git')
makedepends=('cargo' 'patch')
options=(!lto)
provides=('gitpane')
conflicts=('gitpane-git' 'gitpane-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'disable-self-updates.patch')
sha256sums=('a2aa5b2f2c6af958c9505122ba05abe372eff73f74296c3a33b39a2f98edfa65'
            '3de1d97cf8e0f44c381978a5e65de656710d75f2e64595fb295edfdb2ef9cfb4')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < ../disable-self-updates.patch
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 target/release/gitpane "$pkgdir/usr/bin/gitpane"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
