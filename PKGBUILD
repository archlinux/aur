# Maintainer: Senqaii <batuh007@gmail.com>
pkgname=netsplitter-git
pkgver=0.1.0.r0.g820ff9b
pkgrel=9
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
conflicts=('netsplitter')
source=("netsplitter::git+https://github.com/batuh007/-NetSplitter-.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/netsplitter"
    printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$srcdir/netsplitter"

    # Install main application
    install -dm755 "$pkgdir/opt/netsplitter"
    cp -r netsplitter/ "$pkgdir/opt/netsplitter/"
    install -Dm755 run.py "$pkgdir/opt/netsplitter/run.py"

    # Launcher wrapper script — runs as NORMAL USER (no sudo wrapping!)
    # The app internally calls sudo for specific commands, which are
    # whitelisted in /etc/sudoers.d/netsplitter below.
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/netsplitter" << 'EOF'
#!/bin/bash
exec /usr/bin/python3 /opt/netsplitter/run.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/netsplitter"

    # Granular Passwordless Sudo Rules
    # Only the specific system commands NetSplitter needs are whitelisted.
    # The GUI runs as normal user — no root wrapping needed.
    install -dm755 "$pkgdir/etc/sudoers.d"
    cat > "$pkgdir/etc/sudoers.d/netsplitter" << 'SUDOEOF'
# NetSplitter — passwordless access to network management commands
# Network namespace & interface management
ALL ALL=(ALL) NOPASSWD: /usr/bin/ip
# Traffic control (QoS: fq_codel, CAKE, etc.)
ALL ALL=(ALL) NOPASSWD: /usr/bin/tc
# Kernel parameter tuning (BBR, TCP buffers, etc.)
ALL ALL=(ALL) NOPASSWD: /usr/sbin/sysctl
# DNS config file writing
ALL ALL=(ALL) NOPASSWD: /usr/bin/tee
# NIC hardware offload & interrupt coalescing
ALL ALL=(ALL) NOPASSWD: /usr/bin/ethtool
# DHCP inside network namespaces
ALL ALL=(ALL) NOPASSWD: /usr/bin/dhcpcd
# Process cleanup (curl speedtest teardown)
ALL ALL=(ALL) NOPASSWD: /usr/bin/pkill
# Directory creation for DNS namespace config
ALL ALL=(ALL) NOPASSWD: /usr/bin/mkdir
# WiFi power save control (optional)
ALL ALL=(ALL) NOPASSWD: /usr/bin/iw
# CPU governor (optional)
ALL ALL=(ALL) NOPASSWD: /usr/bin/cpupower
# Process priority for GameMode
ALL ALL=(ALL) NOPASSWD: /usr/bin/renice
ALL ALL=(ALL) NOPASSWD: /usr/bin/ionice
# Shell execution for namespace commands
ALL ALL=(ALL) NOPASSWD: /usr/bin/bash
SUDOEOF
    chmod 440 "$pkgdir/etc/sudoers.d/netsplitter"

    # Install icons into XDG hicolor theme
    ICON_SRC="$pkgdir/opt/netsplitter/netsplitter/ui/assets/icons"
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
