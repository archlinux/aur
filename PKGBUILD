# Maintainer: saghm <aur@saghm.com>
_gitlab_repo="https://gitlab.com/saghm/xiba-mod-manager"

pkgname=xiba
pkgver=0.1.2
pkgrel=1
pkgdesc="A Baldur's Gate 3 mod manager for Linux"
arch=('x86_64')
url="$_gitlab_repo"
license=('Apache-2.0')
depends=('gcc-libs')
optdepends=(
    'libx11: X11 display support'
    'libxkbcommon-x11: X11 keyboard support'
    'libxkbcommon: Wayland keyboard support'
    'wayland: native Wayland display support'
    'vulkan-driver: Vulkan rendering backend'
    'opengl-driver: OpenGL rendering fallback'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$_gitlab_repo/-/archive/v${pkgver}/xiba-mod-manager-v${pkgver}.tar.gz")
sha512sums=('5e4652c9b3112d740e6013f49c8fe0074b5341ddeae6af850a7c7cb78cd42279a1b839288850078f6095124017b537ad581f3f5dc49e2cea9835ada00e9a2f9a')

prepare() {
    cd "xiba-mod-manager-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target="$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "xiba-mod-manager-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo build --frozen --release
}

package() {
    cd "xiba-mod-manager-v$pkgver"

    install -Dm755 "$srcdir/target/release/xiba-mod-manager" \
        "$pkgdir/usr/bin/xiba"

    cat > "$srcdir/xiba.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Xiba
Exec=/usr/bin/xiba
Icon=xiba
Categories=Game;Utility;
EOF
    install -Dm644 "$srcdir/xiba.desktop" \
        "$pkgdir/usr/share/applications/xiba.desktop"

    install -Dm644 build-helpers/icon.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/xiba.png"

    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
