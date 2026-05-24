# Maintainer: Berk Kucuk <berkkucukk@proton.me>
pkgname=entropy-shield
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern Linux desktop privacy stack — Tor, DNSCrypt, I2P, Onion Server"
arch=('any')
url="https://github.com/berk-kucuk/entropy-shield"
license=('MIT')
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
)
optdepends=(
    'redsocks: transparent proxy support for I2P routing'
    'firefox: privacy browser integration'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/berk-kucuk/entropy-shield/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('be53eb1ed55d9ed222c0fd66a8f56cf905002f8f294b605941f11c5ebc960a60')

package() {
    cd "$pkgname-$pkgver"

    # Install application files
    install -dm755 "$pkgdir/opt/entropy-shield"
    cp -r core gui logos main.py "$pkgdir/opt/entropy-shield/"
    chmod 755 "$pkgdir/opt/entropy-shield/main.py"

    # Launcher
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/entropy-shield" <<'EOF'
#!/usr/bin/env bash
exec python3 /opt/entropy-shield/main.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/entropy-shield"

    # Icon
    install -Dm644 logos/entropy-logo.png \
        "$pkgdir/usr/share/pixmaps/entropy-shield.png"
    install -Dm644 logos/entropy-logo.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/entropy-shield.png"

    # Desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/entropy-shield.desktop" <<'EOF'
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

    # Polkit policy
    install -dm755 "$pkgdir/usr/share/polkit-1/actions"
    cat > "$pkgdir/usr/share/polkit-1/actions/org.entropyshield.policy" <<'EOF'
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
    <annotate key="org.freedesktop.policykit.exec.argv1">/opt/entropy-shield/main.py</annotate>
  </action>
</policyconfig>
EOF

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
