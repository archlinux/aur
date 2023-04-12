# Maintainer: Bruno Ancona <bruno at powerball253 dot com>

pkgname=eternalmodmanager
pkgver=4.0.3
pkgrel=1
pkgdesc='Cross-platform mod manager for DOOM Eternal.'
arch=('x86_64')
url='https://github.com/PowerBall253/EternalModManager'
license=('MIT')
depends=('gtk4' 'libadwaita' 'openssl')
makedepends=('git' 'cargo')
source=("git+https://github.com/PowerBall253/EternalModManager.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "EternalModManager"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "EternalModManager"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
    mv "target/release/eternal_mod_manager" "target/release/$pkgname"
}


package() {
    cd "EternalModManager"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "resources/com.powerball253.eternalmodmanager.desktop"
    install -Dm644 -t "${pkgdir}/usr/share/metainfo/" "resources/com.powerball253.eternalmodmanager.appdata.xml"
    install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/" "resources/com.powerball253.eternalmodmanager.png"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/com.powerball253.eternalmodmanager" LICENSE
}
