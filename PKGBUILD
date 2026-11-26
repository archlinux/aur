# Maintainer: cyqsimon <28627918+cyqsimon@users.noreply.github.com>

pkgname=minotari
_pkgname=tari
pkgver=6.2.0
pkgrel=1
pkgdesc='Tari layer 1 mainnet node, wallet, mining, and utility applications'
arch=('x86_64' 'aarch64')
url='https://github.com/tari-project/tari'
license=('BSD-3-Clause')
makedepends=('cargo' 'cmake' 'protobuf')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7b5c0936f7197d451ab5236e32a0b8ca9b44a7d525e35e6d41ddf124f8bad5706f5aaf6786dbfd9aa164fc6172a1cf01a490806e4dea99fd63d9a8d1cbd994ab')
options=('!lto')

prepare() {
    cd "$_pkgname-$pkgver"
    cargo fetch --locked
}

build() {
    cd "$_pkgname-$pkgver"

    export TARI_TARGET_NETWORK=mainnet
    cargo build --release --frozen -p 'minotari_*' --bins
}

package() {
    cd "$_pkgname-$pkgver"

    find target/release -maxdepth 1 -type f \
        -name 'minotari_*' -executable \
        -exec install -Dm755 -t "$pkgdir/usr/bin/" {} +

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
