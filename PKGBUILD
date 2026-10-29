# Maintainer: oom <master@spicebrains.com>
pkgname=ie-r
pkgver=0.1.2
pkgrel=1
pkgdesc="Instant Eyedropper Reborn — pixel-perfect color picker"
arch=('x86_64')
url="https://github.com/miaupaw/ie-r"
license=('custom')
depends=(
    'wayland'
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
sha256sums=('8d9effc75c27ae32b311896b5d74c5dd87ab9d85585413b1aeacc431cea58f24')

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
