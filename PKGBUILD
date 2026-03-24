# Maintainer: dresden196 <dwildey@hivelocity.net>

pkgname=openvpn-connect-linux
pkgver=3.8.0
pkgrel=1
pkgdesc="Community port of OpenVPN Connect to Linux"
arch=('x86_64')
url="https://github.com/dresden196/openvpn-connect-linux"
license=('MIT')
depends=('openvpn' 'polkit' 'libsecret' 'electron37' 'hicolor-icon-theme')
makedepends=('npm' 'nodejs' 'python' 'gcc' 'make')
optdepends=(
    'networkmanager: network state detection'
    'libnotify: desktop notifications'
)
provides=('openvpn-connect')
conflicts=('openvpn-connect')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dresden196/openvpn-connect-linux/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    npm install --ignore-optional
}

package() {
    cd "${pkgname}-${pkgver}"

    # Install app files
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -a src/ resources/ assets/ package.json "${pkgdir}/opt/${pkgname}/"
    cp -a node_modules/ "${pkgdir}/opt/${pkgname}/"

    # Launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/openvpn-connect" << 'EOF'
#!/bin/bash
exec electron37 /opt/openvpn-connect-linux --no-sandbox "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/openvpn-connect"

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/openvpn-connect.desktop" << EOF
[Desktop Entry]
Type=Application
Name=OpenVPN Connect
Comment=Community port of OpenVPN Connect to Linux
Exec=openvpn-connect %U
Icon=openvpn-connect
Terminal=false
Categories=Network;VPN;
Keywords=vpn;openvpn;network;
StartupWMClass=openvpn-connect-linux
MimeType=application/x-openvpn-profile;
EOF

    # Icons
    for size in 32 48 64 128 256; do
        install -Dm644 "assets/icons/${size}x${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/openvpn-connect.png" 2>/dev/null || true
    done
    install -Dm644 "assets/icons/app-icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openvpn-connect.png"

    # License
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << EOF
The shim layer (src/) is MIT licensed.
The OpenVPN Connect app (resources/app/) is the property of OpenVPN Inc.
See https://openvpn.net/terms/ for terms of service.
EOF
}
