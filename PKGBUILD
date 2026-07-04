# Maintainer: Berk Kucuk <berkkucukk@proton.me>
pkgname=entropy-shield
pkgver=4.1.0
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
sha256sums=('01c4e0068ba27a2db8e02df3530bb5e0fb3cba963be1ecc93018a5ac6cb4c577')

package() {
    cd "$pkgname-$pkgver"

    # Application files
    install -dm755 "$pkgdir/opt/entropy-shield"
    cp -r core gui logos Fonts main.py "$pkgdir/opt/entropy-shield/"
    chmod 755 "$pkgdir/opt/entropy-shield/main.py"

    # Launcher — runs as the normal user; privileged operations go through the
    # root entropy-shield daemon over its group-restricted socket.
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

    # Privileged daemon — systemd service (runs as root, drives all privileged
    # operations). The GUI talks to it over /run/entropy-shield/daemon.sock.
    install -Dm644 entropy-shield.service \
        "$pkgdir/usr/lib/systemd/system/entropy-shield.service"

    # System group that gates access to the daemon socket (root:entropy-shield
    # 0660).  systemd-sysusers creates it on install; the user adds themselves
    # with: usermod -aG entropy-shield <user>  (see the post-install message).
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/lib/sysusers.d/entropy-shield.conf" <<'EOF'
g entropy-shield -
EOF

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
