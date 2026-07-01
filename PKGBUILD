# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=gitpane
pkgver=0.8.2
pkgrel=1
pkgdesc='Multi-repo Git workspace dashboard for the terminal'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/affromero/gitpane'
license=('MIT')
depends=('git')
makedepends=(
    'cargo'
    'patch'
)
options=(
    !lto
    !debug
)
provides=('gitpane')
conflicts=('gitpane-git' 'gitpane-bin')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'disable-self-updates.patch'
)
sha256sums=(
    '9315ce6fcb46145a82085f44e8c65e40069944b1f84d260d93e405edcd567539'
    '5b6b6bd1ab83ddf83484106219ffdb06cd52e17a0803ed0d0c28493f74ecbca2'
)

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
