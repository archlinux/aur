# Maintainer: zero <zero@localhost>
# Automatically updated by GitHub Actions

pkgname=zerx-lab-fluxdown-bin
pkgver=0.1.26
pkgrel=1
pkgdesc="FluxDown - Rust 驱动的多协议下载管理器（HTTP/FTP/BitTorrent）"
arch=('x86_64')
url="https://fluxdown.zerx.dev"
license=('LicenseRef-proprietary')
depends=(
    'gtk3'
    'libnotify'
    'nss'
    'libxss'
    'libxtst'
    'xdg-utils'
    'at-spi2-core'
    'libsecret'
    'libayatana-appindicator'
)
provides=('fluxdown')
conflicts=('fluxdown')
options=('!strip')

source_x86_64=("FluxDown-${pkgver}-linux-x64.tar.gz::https://fluxdown.zerx.dev/api/download/FluxDown-${pkgver}-linux-x64.tar.gz")
sha256sums_x86_64=('a2d300efdb7f66adcd2a2c97dd7e44d2119332ba6f6685c0d7759d7be677f5cd')

package() {
    cd "$srcdir/FluxDown-${pkgver}-linux-x64"

    # 主程序和 NMH 二进制
    install -Dm755 flux_down       "$pkgdir/opt/fluxdown/flux_down"
    install -Dm755 fluxdown_nmh    "$pkgdir/opt/fluxdown/fluxdown_nmh"

    # .so 插件库
    for lib in lib/*.so; do
        install -Dm755 "$lib" "$pkgdir/opt/fluxdown/$lib"
    done

    # native_assets.json（Flutter 运行时需要）
    echo '{"format-version":[1,0,0],"native-assets":{}}' \
        > "$pkgdir/opt/fluxdown/lib/native_assets.json"

    # data 目录（flutter_assets、图标、desktop 等）
    cp -r data/ "$pkgdir/opt/fluxdown/data/"

    # /usr/bin 启动脚本
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/flux_down" <<'EOF'
#!/bin/bash
exec /opt/fluxdown/flux_down "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/flux_down"

    # 桌面文件（Exec 保持 flux_down，与现有包一致）
    install -Dm644 data/com.fluxdown.app.desktop \
        "$pkgdir/usr/share/applications/com.fluxdown.app.desktop"

    # 图标
    install -Dm644 \
        data/icons/hicolor/256x256/apps/com.fluxdown.app.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.fluxdown.app.png"
    install -Dm644 \
        data/icons/hicolor/scalable/apps/com.fluxdown.app.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.fluxdown.app.svg"

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
    install -Dm644 /dev/stdin \
        "$pkgdir/etc/chromium/native-messaging-hosts/com.fluxdown.nmh.json" \
        <<< "$_nmh_manifest"
    install -Dm644 /dev/stdin \
        "$pkgdir/etc/opt/chrome/native-messaging-hosts/com.fluxdown.nmh.json" \
        <<< "$_nmh_manifest"

    # Native Messaging Host — Firefox
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/lib/mozilla/native-messaging-hosts/com.fluxdown.nmh.json" \
        <<'EOF'
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
}
