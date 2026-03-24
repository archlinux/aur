# Maintainer: dresden196 <dwildey@hivelocity.net>

pkgname=openvpn-connect-linux-appimage
pkgver=3.8.0
pkgrel=1
pkgdesc="Community port of OpenVPN Connect to Linux"
arch=('x86_64')
url="https://github.com/dresden196/openvpn-connect-linux"
license=('MIT')
depends=('openvpn' 'polkit' 'libsecret' 'fuse2' 'hicolor-icon-theme')
optdepends=(
    'networkmanager: network state detection'
    'libnotify: desktop notifications'
)
provides=('openvpn-connect')
conflicts=('openvpn-connect')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/dresden196/openvpn-connect-linux/releases/download/v${pkgver}/openvpn-connect-linux-${pkgver}-x86_64.AppImage")
sha256sums=('b204d0494474fdba1a5831eab413538051a16e2b8601b16b1b6a8629023f2df5')
noextract=("${pkgname}-${pkgver}.AppImage")

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -a squashfs-root/* "${pkgdir}/opt/${pkgname}/"

    # Desktop entry
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/openvpn-connect.desktop" << EOF
[Desktop Entry]
Type=Application
Name=OpenVPN Connect
Comment=Community port of OpenVPN Connect to Linux
Exec=/opt/${pkgname}/openvpn-connect-linux --no-sandbox %U
Icon=openvpn-connect
Terminal=false
Categories=Network;VPN;
Keywords=vpn;openvpn;network;
StartupWMClass=openvpn-connect-linux
MimeType=application/x-openvpn-profile;
EOF

    # Icons
    for size in 16 32 48 64 128 256; do
        if [ -f "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/openvpn-connect-linux.png" ]; then
            install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/openvpn-connect-linux.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/openvpn-connect.png"
        fi
    done

    # Symlink binary
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/openvpn-connect-linux" "${pkgdir}/usr/bin/openvpn-connect"

    # License
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << EOF
The shim layer is MIT licensed.
The OpenVPN Connect app is the property of OpenVPN Inc.
See https://openvpn.net/terms/ for terms of service.
EOF
}
