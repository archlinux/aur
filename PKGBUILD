# Maintainer: Josh Ellithorpe <quest@mac.com>
pkgname=nexus-client
pkgver=0.5.1
pkgrel=1
pkgdesc="Cross-platform BBS client with chat, file transfers, and news support"
arch=('x86_64' 'aarch64')
url="https://github.com/zquestz/nexus"
license=('MIT')
depends=('alsa-lib')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zquestz/nexus/archive/v$pkgver.tar.gz")
sha256sums=('be45d9a5ebcca9f33e8f888200b4af1dd5c25f04c989a4a8daa0cf65612b21e5')

prepare() {
    cd "nexus-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "nexus-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p nexus-client
}

package() {
    cd "nexus-$pkgver"

    # Binary
    install -Dm755 "target/release/nexus" "$pkgdir/usr/bin/nexus"

    # Desktop file
    install -Dm644 "nexus-client/assets/linux/nexus.desktop" "$pkgdir/usr/share/applications/nexus.desktop"

    # Icon
    install -Dm644 "nexus-client/assets/linux/nexus.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/nexus.svg"

    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
