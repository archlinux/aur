# Maintainer: Senqaii <batuh007@gmail.com>
pkgname=netsplitter
pkgver=0.1.1
pkgrel=1
pkgdesc="Advanced Linux Network Namespace Isolation & QoS Bufferbloat Automation Framework"
arch=('any')
url="https://github.com/batuh007/-NetSplitter-"
license=('custom:Proprietary')
depends=(
    'python'
    'python-pyqt6'
    'qt6-svg'
    'iproute2'
    'iptables'
    'dhcpcd'
    'ethtool'
)
optdepends=(
    'mtr: Advanced traceroute hop analysis'
    'iw: WiFi power save control'
    'cpupower: CPU governor management'
    'vnstat: Network traffic statistics'
    'curl: Network testing'
)
provides=('netsplitter')
conflicts=('netsplitter-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/batuh007/-NetSplitter-/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bd99403ec6168224ac19d10fc492fbe488c9b664dbe39be9f506a3669c400b8a')

package() {
    cd "-NetSplitter--${pkgver}"

    # Install main application
    install -dm755 "$pkgdir/opt/netsplitter"
    cp -r netsplitter/ "$pkgdir/opt/netsplitter/"
    install -Dm755 run.py "$pkgdir/opt/netsplitter/run.py"

    # Launcher wrapper script — runs as NORMAL USER
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/netsplitter" << 'EOF'
#!/bin/bash
exec /usr/bin/python3 /opt/netsplitter/run.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/netsplitter"

    # Granular Passwordless Sudo Rules
    install -dm755 "$pkgdir/etc/sudoers.d"
    cat > "$pkgdir/etc/sudoers.d/netsplitter" << 'SUDOEOF'
# NetSplitter — passwordless access to network management commands
ALL ALL=(ALL) NOPASSWD: /usr/bin/ip
ALL ALL=(ALL) NOPASSWD: /usr/bin/tc
ALL ALL=(ALL) NOPASSWD: /usr/bin/sysctl
ALL ALL=(ALL) NOPASSWD: /usr/bin/tee
ALL ALL=(ALL) NOPASSWD: /usr/bin/ethtool
ALL ALL=(ALL) NOPASSWD: /usr/bin/dhcpcd
ALL ALL=(ALL) NOPASSWD: /usr/bin/pkill
ALL ALL=(ALL) NOPASSWD: /usr/bin/mkdir
ALL ALL=(ALL) NOPASSWD: /usr/bin/iw
ALL ALL=(ALL) NOPASSWD: /usr/bin/cpupower
ALL ALL=(ALL) NOPASSWD: /usr/bin/renice
ALL ALL=(ALL) NOPASSWD: /usr/bin/ionice
ALL ALL=(ALL) NOPASSWD: /usr/bin/bash
ALL ALL=(ALL) NOPASSWD: /usr/bin/systemctl
SUDOEOF
    chmod 440 "$pkgdir/etc/sudoers.d/netsplitter"

    # Install icons into XDG hicolor theme
    ICON_SRC="netsplitter/ui/assets/icons"
    for size in 512x512 128x128 64x64 32x32; do
        install -dm755 "$pkgdir/usr/share/icons/hicolor/${size}/apps"
    done
    install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"

    install -Dm644 "${ICON_SRC}/app_logo.png"      "$pkgdir/usr/share/icons/hicolor/512x512/apps/netsplitter.png"
    install -Dm644 "${ICON_SRC}/launcher_dock.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/netsplitter.png"
    install -Dm644 "${ICON_SRC}/tray_32x32.png"    "$pkgdir/usr/share/icons/hicolor/64x64/apps/netsplitter.png"
    install -Dm644 "${ICON_SRC}/tray_16x16.png"    "$pkgdir/usr/share/icons/hicolor/32x32/apps/netsplitter.png"
    install -Dm644 "${ICON_SRC}/app_logo.svg"      "$pkgdir/usr/share/icons/hicolor/scalable/apps/netsplitter.svg"

    # Desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/netsplitter.desktop" << 'EOF'
[Desktop Entry]
Name=NetSplitter
Comment=Network Namespace Isolation & QoS Tool
Exec=/usr/bin/netsplitter
Icon=netsplitter
Terminal=false
Type=Application
Categories=Network;System;
Keywords=network;optimization;gaming;qos;namespace;
EOF
    chmod 644 "$pkgdir/usr/share/applications/netsplitter.desktop"
}
