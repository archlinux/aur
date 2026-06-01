# Maintainer: Berk Kucuk <berkkucukk@proton.me>
pkgname=entropy-shield
pkgver=3.0.0
pkgrel=1
pkgdesc="Modern Linux desktop privacy stack — Tor, DNSCrypt, I2P, Onion Server"
arch=('any')
url="https://github.com/berk-kucuk/entropy-shield"
license=('MIT')
install="$pkgname.install"
depends=(
    'python>=3.10'
    'python-pyqt6'
    'tor'
    'dnscrypt-proxy'
    'i2pd'
    'nftables'
    'iptables-nft'
    'iproute2'
    'polkit'
    'conntrack-tools'
    'curl'
)
optdepends=(
    'redsocks: transparent proxy support for I2P routing'
    'obfs4proxy: Tor bridge pluggable transport (obfs4/meek-azure)'
    'snowflake-tor: Tor Snowflake bridge pluggable transport'
    'bind: dig command for DNS leak tests'
    'firefox: isolated browser integration'
    'chromium: isolated browser integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/berk-kucuk/entropy-shield/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('28f2f3265f7abf2392f9ffe7c322d5cab9b27d34e61e713ddb05c8e505eceb91')

package() {
    cd "$pkgname-$pkgver"

    # Application files
    install -dm755 "$pkgdir/opt/entropy-shield"
    cp -r core gui logos Fonts main.py "$pkgdir/opt/entropy-shield/"
    chmod 755 "$pkgdir/opt/entropy-shield/main.py"

    # Launcher
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/entropy-shield" <<'EOF'
#!/usr/bin/env bash
exec python3 /opt/entropy-shield/main.py "$@"
EOF

    # Icon — OLED logo
    install -Dm644 logos/oled.png \
        "$pkgdir/usr/share/pixmaps/entropy-shield.png"
    install -Dm644 logos/oled.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/entropy-shield.png"

    # Desktop entry
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/entropy-shield.desktop" <<'EOF'
[Desktop Entry]
Name=Entropy Shield
Comment=Network Privacy Stack — Tor, DNSCrypt, I2P
Exec=entropy-shield
Icon=entropy-shield
Type=Application
Categories=Network;Security;
Terminal=false
StartupWMClass=entropy-shield
EOF

    # Systemd service (headless / server mode — optional)
    install -Dm644 entropy-shield.service \
        "$pkgdir/usr/lib/systemd/system/entropy-shield.service"

    # Polkit policy
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/polkit-1/actions/org.entropyshield.policy" <<'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE policyconfig PUBLIC
  "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
  "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
<policyconfig>
  <action id="org.entropyshield.run">
    <description>Run Entropy Shield</description>
    <message>Authentication required to manage network privacy layers</message>
    <defaults>
      <allow_any>auth_admin</allow_any>
      <allow_inactive>auth_admin</allow_inactive>
      <allow_active>auth_admin_keep</allow_active>
    </defaults>
    <annotate key="org.freedesktop.policykit.exec.path">/usr/bin/python3</annotate>
    <annotate key="org.freedesktop.policykit.exec.argv1">/opt/entropy-shield/core/privileged_runner.py</annotate>
  </action>
</policyconfig>
EOF

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
