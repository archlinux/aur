# Maintainer: Pasical <pasicalyang@gmail.com>
# Rendered by Everywhere-AUR/scripts/sync_release.py; submit out/PKGBUILD.
pkgname=everywhere-bin
pkgver=0.9.0
pkgrel=1
pkgdesc='Context-aware AI assistant for your desktop'
arch=('x86_64')
url='https://github.com/Sylinko/Everywhere'
license=('BSL-1.1')
depends=('python' 'glibc' 'gcc-libs' 'zlib' 'openssl' 'icu' 'fontconfig' 'libx11' 'libice' 'libsm' 'libxext' 'libxcb' 'libxrandr' 'libxrender' 'libxi' 'libxcursor' 'wayland' 'libxkbcommon' 'glib2' 'at-spi2-core' 'xdg-utils' 'desktop-file-utils')
optdepends=('grim: Hyprland screenshot capture' 'wl-clipboard: Wayland text-selection monitoring' 'libnotify: desktop notifications')
provides=('everywhere')
conflicts=('everywhere')
_upstream_tag='v0.9.0'
_mirror_repository='pasical/Everywhere-AUR'
_base="https://github.com/${_mirror_repository}/releases/download/${_upstream_tag}"
source=("${_base}/LICENSE" "${_base}/Everywhere-icon.png")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0' 'ef52179d078f3ee23a1eec9ded2dbb8a9529de49dd4412375fea7566f9f83c34')
source_x86_64=("${_base}/Everywhere-Linux-x64-v0.9.0.tar.zst")
sha256sums_x86_64=('5d5916b97b9fe428e3c0d50380a5c4e4140cb6203b58a2afad50221720e73eae')
noextract=("Everywhere-Linux-x64-${_upstream_tag}.tar.zst" "Everywhere-Linux-arm64-${_upstream_tag}.tar.zst")

package() {
    local runtime
    case "$CARCH" in
        x86_64) runtime=x64 ;;
        aarch64) runtime=arm64 ;;
        *) return 1 ;;
    esac
    install -d "$pkgdir/opt/Everywhere" "$pkgdir/usr/bin"
    bsdtar -xf "$srcdir/Everywhere-Linux-${runtime}-${_upstream_tag}.tar.zst" -C "$pkgdir/opt/Everywhere" --no-same-owner
    chmod 755 "$pkgdir/opt/Everywhere/Everywhere" "$pkgdir/opt/Everywhere/Everywhere.Watchdog"
    ln -s /opt/Everywhere/Everywhere "$pkgdir/usr/bin/Everywhere"
    ln -s /opt/Everywhere/Everywhere "$pkgdir/usr/bin/ew"
    install -Dm644 "$srcdir/Everywhere-icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/Everywhere.png"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/Everywhere.desktop" <<'EOF'
[Desktop Entry]
Name=Everywhere
Comment=A context-aware AI assistant for your desktop.
Exec=/usr/bin/Everywhere %U
Icon=Everywhere
Type=Application
Terminal=false
Categories=Utility;
Keywords=AI;tool;
EOF
}
