# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=gitpane
pkgver=0.16.1
pkgrel=1
pkgdesc='Multi-repo Git workspace dashboard for the terminal'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/affromero/gitpane'
license=('MIT')
depends=(
    'git'
    'xdg-utils'
)
optdepends=(
    'github-cli: For improved github integration'
)
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
    '0001-clean-disable-the-self-update-subcommand.patch'
)
sha256sums=(
    '9e75850c6a88157a11cead9a99be025018aa39fd85a22f3d2d1b5ff88e31e0b2'
    '585746e0713807290faffbb4521668c1f15d1d96ecef6a7cc0b393dce272d2c3'
)

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 < ../0001-clean-disable-the-self-update-subcommand.patch
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
