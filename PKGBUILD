# Maintainer: abyss <viewerofall on GitHub>
pkgname=woven
pkgver=2.2.2
pkgrel=1
pkgdesc="Wayland workspace overlay — plugin system, control panel, AI namer, bar widgets"
arch=('x86_64')
url="https://github.com/viewerofall/woven"
license=('MIT')
depends=(
    'wayland'
    'libxkbcommon'
    'mesa'              # wgpu software fallback
)
optdepends=(
    'cava: audio spectrum visualizer widget'
    'niri: primary compositor target'
)
makedepends=(
    'rust'
    'cargo'
    'pkg-config'
    'cmake'             # mlua vendored Lua build
)
source=("$pkgname-v$pkgver.tar.gz::https://github.com/viewerofall/woven/releases/download/v$pkgver/v$pkgver.tar.gz")
sha256sums=('9cac024dd4220f4c35882d6f598e2bf3dce337c01ec59482600b9ef23e2cc00e')

prepare() {
    cd "$srcdir/$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build \
        --frozen \
        --release \
        --bin woven \
        --bin woven-ctrl
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"

    # Binaries
    install -Dm755 target/release/woven        "$pkgdir/usr/bin/woven"
    install -Dm755 target/release/woven-ctrl   "$pkgdir/usr/bin/woven-ctrl"

    # Systemd user service
    install -Dm644 woven.service \
        "$pkgdir/usr/lib/systemd/user/woven.service"

    # Desktop entry for woven-ctrl
    install -Dm644 woven-ctrl.desktop \
        "$pkgdir/usr/share/applications/woven-ctrl.desktop"

    # Icon
    install -Dm644 woven_icon.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/woven.png"

    # Default config skeleton (users copy to ~/.config/woven/)
    install -Dm644 woven.lua \
        "$pkgdir/etc/woven/woven.lua"

    # Runtime Lua files loaded by the daemon
    install -dm755 "$pkgdir/usr/share/woven/runtime"
    cp -r runtime/. "$pkgdir/usr/share/woven/runtime/"

    # Default plugins shipped with woven
    install -dm755 "$pkgdir/usr/share/woven/plugins"
    cp -r plugins/. "$pkgdir/usr/share/woven/plugins/"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
