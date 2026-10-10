# Maintainer: zero <zero@localhost>
# Automatically updated by GitHub Actions

pkgname=zerx-lab-fluxdown-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="FluxDown - Rust 驱动的多协议下载管理器（HTTP/FTP/BitTorrent）"
arch=('x86_64')
url="https://fluxdown.zerx.dev"
license=('LicenseRef-proprietary')
depends=(
    'alsa-lib'
    'dbus'
    'fontconfig'
    'freetype2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libayatana-appindicator'
    'libgcc'
    'libstdc++'
    'libx11'
    'libxkbcommon'
    'libxkbcommon-x11'
    'vulkan-icd-loader'
    'wayland'
    'xdotool'
    'xdg-utils'
)
provides=('fluxdown')
conflicts=('fluxdown')
options=('!strip')

source_x86_64=("FluxDown-${pkgver}-linux-x64.tar.gz::https://github.com/zerx-lab/FluxDown/releases/download/v${pkgver}/FluxDown-${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('6cbb3d15277e145cd556911fd1a740142563752d31d7180baededcc91fa8c0e1')

package() {
    cd "$srcdir/FluxDown-${pkgver}-linux-x64"

    # 四个二进制必须同目录，宿主按 current_exe 查找兄弟进程。
    local binary
    for binary in fluxdown-desktop fluxdown-agent fluxdownd fluxdown_nmh; do
        install -Dm755 "$binary" "$pkgdir/opt/fluxdown/$binary"
    done

    install -d "$pkgdir/usr/bin"
    ln -s /opt/fluxdown/fluxdown-desktop "$pkgdir/usr/bin/fluxdown-desktop"
    ln -s /opt/fluxdown/fluxdown-agent "$pkgdir/usr/bin/fluxdown-agent"

    # 对齐上游 Arch 包的旧自启迁移：--silentStart 转交 agent。
    cat > "$pkgdir/opt/fluxdown/flux_down" <<'EOF'
#!/bin/sh
if [ "$1" = "--silentStart" ]; then
    shift
    exec /opt/fluxdown/fluxdown-agent --autostart "$@"
fi
exec /opt/fluxdown/fluxdown-desktop "$@"
EOF
    chmod 755 "$pkgdir/opt/fluxdown/flux_down"
    ln -s /opt/fluxdown/flux_down "$pkgdir/usr/bin/flux_down"

    # GPUI 资源已内嵌，desktop 和图标位于发布包根目录。
    install -Dm644 com.fluxdown.app.desktop \
        "$pkgdir/usr/share/applications/com.fluxdown.app.desktop"
    install -Dm644 com.fluxdown.app.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.fluxdown.app.png"

    # Native Messaging Host — Chromium / Chrome / Brave
    local _nmh_manifest
    _nmh_manifest='{
  "name": "com.fluxdown.nmh",
  "description": "FluxDown Native Messaging Host",
  "path": "/opt/fluxdown/fluxdown_nmh",
  "type": "stdio",
  "allowed_origins": [
    "chrome-extension://meleenglfggcmcajknpeeeiobnpfmahc/"
  ]
}'
    local manifest_dir
    for manifest_dir in etc/chromium/native-messaging-hosts etc/opt/chrome/native-messaging-hosts; do
        install -d "$pkgdir/$manifest_dir"
        printf '%s\n' "$_nmh_manifest" > "$pkgdir/$manifest_dir/com.fluxdown.nmh.json"
        chmod 644 "$pkgdir/$manifest_dir/com.fluxdown.nmh.json"
    done

    # Native Messaging Host — Firefox
    install -d "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
    cat > "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.fluxdown.nmh.json" <<'EOF'
{
  "name": "com.fluxdown.nmh",
  "description": "FluxDown Native Messaging Host",
  "path": "/opt/fluxdown/fluxdown_nmh",
  "type": "stdio",
  "allowed_extensions": [
    "fluxdown@fluxdown.app"
  ]
}
EOF
    chmod 644 "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.fluxdown.nmh.json"
}
