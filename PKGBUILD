# Maintainer: Martin Etchebarne <martin@etchebarne.net>
pkgname=kosmos
pkgver=0.1.6
pkgrel=1
pkgdesc="A highly customizable and versatile tab-based code editor."
arch=('x86_64')
url="https://github.com/etchebarne/kosmos"
license=('MIT')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3' 'librsvg')
makedepends=('rust' 'musl' 'bun-bin' 'patchelf')
provides=('kosmos')
conflicts=('kosmos-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/etchebarne/kosmos/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}-${pkgver}"
    rustup target add x86_64-unknown-linux-musl
    bun install
}

build() {
    cd "${pkgname}-${pkgver}"

    # Build kosmos-agent for musl
    cd src-tauri
    cargo build -p kosmos-agent --release --target x86_64-unknown-linux-musl --target-dir target/agent-linux
    mkdir -p resources
    cp target/agent-linux/x86_64-unknown-linux-musl/release/kosmos-agent resources/kosmos-agent
    cd ..

    # Build frontend
    bun run build

    # Build Tauri app
    cd src-tauri
    cargo build --release
}

package() {
    cd "${pkgname}-${pkgver}"

    # Binary
    install -Dm755 src-tauri/target/release/kosmos "$pkgdir/usr/bin/kosmos"

    # Agent binary
    install -Dm755 src-tauri/resources/kosmos-agent "$pkgdir/usr/lib/kosmos/resources/kosmos-agent"

    # Desktop file
    install -Dm644 src-tauri/kosmos.desktop "$pkgdir/usr/share/applications/kosmos.desktop"

    # Icons
    install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/kosmos.png"
    install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/kosmos.png"
    install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/kosmos.png"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
