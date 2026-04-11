# Maintainer: Senqaii <batuh007@gmail.com>
pkgname=netsplitter-git
pkgver=0.1.0.r0.g820ff9b
pkgrel=2
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
    'polkit'
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

    # Launcher wrapper script (uses sudo to preserve user session for tray/GUI)
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/netsplitter" << 'EOF'
#!/bin/bash
# Run as root while preserving DISPLAY/WAYLAND for GUI + DBUS for tray
exec sudo -E python3 /opt/netsplitter/run.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/netsplitter"

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

    # Polkit policy
    install -dm755 "$pkgdir/usr/share/polkit-1/actions"
    cat > "$pkgdir/usr/share/polkit-1/actions/org.netsplitter.policy" << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE policyconfig PUBLIC
 "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
 "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
<policyconfig>
  <action id="org.netsplitter.run">
    <description>Run NetSplitter with elevated privileges</description>
    <message>NetSplitter requires root access for network namespace management</message>
    <defaults>
      <allow_any>auth_admin</allow_any>
      <allow_inactive>auth_admin</allow_inactive>
      <allow_active>auth_admin_keep</allow_active>
    </defaults>
    <annotate key="org.freedesktop.policykit.exec.path">/opt/netsplitter/run.py</annotate>
    <annotate key="org.freedesktop.policykit.exec.allow_gui">true</annotate>
  </action>
</policyconfig>
EOF
    chmod 644 "$pkgdir/usr/share/polkit-1/actions/org.netsplitter.policy"
}
