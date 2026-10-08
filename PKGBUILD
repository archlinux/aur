# Maintainer: Arnaud Gissinger <agissing@student.42.fr>
pkgname=pen-dev-appimage
pkgver=1.2.16
pkgrel=1
pkgdesc='Pen: AI-powered design canvas (formerly Pencil) (appimage)'
arch=('x86_64' 'aarch64')
url='https://www.pen.dev'
license=('LicenseRef-Pen-EULA')
provides=("pen-dev=$pkgver" "pencil-dev=$pkgver")
conflicts=('pen-dev' 'pen-dev-bin' 'pencil-dev' 'pencil-dev-bin' 'pencil-dev-appimage')
options=('!strip' '!debug')
depends=('fuse2' 'glibc' 'hicolor-icon-theme' 'zlib')
makedepends=('python' 'squashfs-tools')
_release="https://github.com/highagency/pen-desktop-releases/releases/download/v${pkgver}"
source=('pen-dev.desktop' 'pen-dev.png' 'LICENSE' 'extract-appimage.py')
sha256sums=(
    '8d8a5cacedc15daea8974cbf6e33edaace4b9542a2117cf1df082dd413a00138'
    '5898e0189970c8995fc14978ad9b91483d787d2842a01369e29da928b49cc75a'
    '42b82acedd61dfb095f44aaadbc58b703fabaa1c25d60b6e133231a0c70c8c53'
    'c488ed6256fd9663637e95d5e5e8632b523d22e5f873145c76ccf016d409081d'
)
source_x86_64=("${_release}/Pen-${pkgver}-linux-x86_64.AppImage")
sha256sums_x86_64=('7586d0c50d85609aa754043cd6dad918ddb697fdeeca79ed8f26bb5ca4d2b06a')
source_aarch64=("${_release}/Pen-${pkgver}-linux-arm64.AppImage")
sha256sums_aarch64=('e651425dbaa22d315c52ab23f84c25f75d1814cb89ddc77fd280b97d680112cc')

noextract=("Pen-${pkgver}-linux-x86_64.AppImage" "Pen-${pkgver}-linux-arm64.AppImage")

prepare() {
    local upstream_arch=x86_64
    [[ $CARCH == aarch64 ]] && upstream_arch=arm64
    rm -rf "$srcdir/squashfs-root"
    python "$srcdir/extract-appimage.py" "Pen-$pkgver-linux-$upstream_arch.AppImage" "$srcdir/squashfs-root"
}

package() {
    local upstream_arch=x86_64 mcp_arch=x64
    if [[ $CARCH == aarch64 ]]; then
        upstream_arch=arm64
        mcp_arch=arm64
    fi
    install -Dm755 "$srcdir/Pen-$pkgver-linux-$upstream_arch.AppImage" "$pkgdir/opt/pen-dev-appimage/pen-dev.AppImage"
    install -d "$pkgdir/usr/bin"
    # Match upstream's AppImage desktop launcher; pass all user arguments through.
    cat > "$pkgdir/usr/bin/pen-dev" <<'LAUNCHER'
#!/bin/sh
exec /opt/pen-dev-appimage/pen-dev.AppImage --no-sandbox "$@"
LAUNCHER
    chmod 755 "$pkgdir/usr/bin/pen-dev"
    ln -s pen-dev "$pkgdir/usr/bin/pencil-dev"
    install -Dm755 "$srcdir/squashfs-root/resources/app.asar.unpacked/out/mcp-server-linux-$mcp_arch" "$pkgdir/opt/pen-dev-appimage/mcp-server"
    install -Dm644 "$srcdir/pen-dev.desktop" "$pkgdir/usr/share/applications/pen-dev.desktop"
    install -Dm644 "$srcdir/pen-dev.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/pen-dev.png"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
