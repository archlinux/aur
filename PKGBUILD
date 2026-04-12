# Maintainer: oom <master@spicebrains.com>
pkgname=ie-r
pkgver=0.1.0
pkgrel=1
pkgdesc="Instant Eyedropper Reborn — pixel-perfect color picker"
arch=('x86_64')
url="https://github.com/miaupaw/ie-r"
license=('custom')
depends=(
    'wayland'
    'pipewire'
    'libxkbcommon'
    'dbus'
    'fontconfig'
    'libx11'
    'libxcursor'
    'libxrandr'
    'libxi'
)
makedepends=(
    'rust'
    'cargo'
    'clang'
    'pkg-config'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('da97ea5e36f819511d5416b0bb81751fb8274c9e4e785c4117810624737d5729')

build() {
    cd "$pkgname-$pkgver"
    export LIBCLANG_PATH="/usr/lib"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"

    # Binary
    install -Dm755 "target/release/ie-r" "$pkgdir/usr/bin/ie-r"

    # Desktop entry (X-KDE-DBUS-Restricted-Interfaces for KWin ScreenShot2 authorization)
    install -Dm644 "assets/ie-r.desktop" "$pkgdir/usr/share/applications/ie-r.desktop"
    sed -i 's|Exec=ie-r|Exec=/usr/bin/ie-r|' "$pkgdir/usr/share/applications/ie-r.desktop"

    # Icon
    install -Dm644 "assets/ie-r.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/ie-r.svg"

    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
