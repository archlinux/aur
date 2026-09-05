# Maintainer: Dresden Wildey <dresden196@users.noreply.github.com>

pkgname=openvpn-connect-linux
pkgver=3.8.2
pkgrel=1
pkgdesc="Community port of OpenVPN Connect to Linux"
arch=('x86_64')
url="https://github.com/dresden196/openvpn-connect-linux"
license=('MIT' 'LicenseRef-OpenVPN-Connect')
depends=('openvpn' 'polkit' 'libsecret' 'electron37' 'hicolor-icon-theme')
makedepends=('npm' 'nodejs' 'python' 'gcc' 'make')
optdepends=(
    'networkmanager: network state detection'
    'libnotify: desktop notifications'
)
provides=('openvpn-connect')
conflicts=('openvpn-connect')
options=('!strip' '!debug')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dresden196/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a051308855e6a6df895c419bfe3bcf1feaf3f182a66212a4b34bc1157e102947')

build() {
    cd "${pkgname}-${pkgver}"
    npm install --omit=dev
}

package() {
    cd "${pkgname}-${pkgver}"

    # Install application to /usr/lib
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 package.json "${pkgdir}/usr/lib/${pkgname}/package.json"

    # Source files
    install -dm755 "${pkgdir}/usr/lib/${pkgname}/src/shims"
    install -Dm644 src/main.js "${pkgdir}/usr/lib/${pkgname}/src/main.js"
    install -Dm644 src/shims/napi-shim.js "${pkgdir}/usr/lib/${pkgname}/src/shims/napi-shim.js"
    install -Dm644 src/shims/electron-shim.js "${pkgdir}/usr/lib/${pkgname}/src/shims/electron-shim.js"
    install -Dm644 src/shims/keytar-shim.js "${pkgdir}/usr/lib/${pkgname}/src/shims/keytar-shim.js"
    install -Dm644 src/shims/pkcs11-shim.js "${pkgdir}/usr/lib/${pkgname}/src/shims/pkcs11-shim.js"

    # App icons (needed by electron-shim.js for window/taskbar icon)
    install -dm755 "${pkgdir}/usr/lib/${pkgname}/assets/icons"
    find assets/icons -type f -name "*.png" -exec install -Dm644 {} "${pkgdir}/usr/lib/${pkgname}/{}" \;

    # Resources (original app assets)
    install -dm755 "${pkgdir}/usr/lib/${pkgname}/resources/app"
    find resources/app -type f -exec install -Dm644 {} "${pkgdir}/usr/lib/${pkgname}/{}" \;

    # Node modules (runtime deps only, no electron/builder)
    cp -a node_modules "${pkgdir}/usr/lib/${pkgname}/"

    # Remove dev/build artifacts that shouldn't be packaged
    rm -rf "${pkgdir}/usr/lib/${pkgname}/node_modules/electron" \
           "${pkgdir}/usr/lib/${pkgname}/node_modules/electron-builder" \
           "${pkgdir}/usr/lib/${pkgname}/node_modules/@electron/rebuild" \
           "${pkgdir}/usr/lib/${pkgname}/node_modules/app-builder-bin" \
           "${pkgdir}/usr/lib/${pkgname}/node_modules/app-builder-lib" \
           "${pkgdir}/usr/lib/${pkgname}/node_modules/7zip-bin" \
           "${pkgdir}/usr/lib/${pkgname}/node_modules/dmg-builder" \
           "${pkgdir}/usr/lib/${pkgname}/node_modules/electron-publish"

    # Clean python bytecode caches (contain $srcdir references)
    find "${pkgdir}" -name "__pycache__" -type d -exec rm -rf {} + 2>/dev/null || true
    find "${pkgdir}" -name "*.pyc" -delete 2>/dev/null || true

    # Clean build artifacts
    find "${pkgdir}" -name "*.o" -delete 2>/dev/null || true
    find "${pkgdir}" -name "*.o.d" -delete 2>/dev/null || true
    find "${pkgdir}" -path "*/build/config.gypi" -delete 2>/dev/null || true
    find "${pkgdir}" -path "*/build/Makefile" -delete 2>/dev/null || true
    find "${pkgdir}" -path "*/build/Release/.deps" -type d -exec rm -rf {} + 2>/dev/null || true

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}/usr/lib/${pkgname}/node_modules"

    # Launcher script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/openvpn-connect" << 'EOF'
#!/bin/bash
exec electron37 /usr/lib/openvpn-connect-linux --no-sandbox "$@"
EOF

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
        if [ -f "assets/icons/${size}x${size}.png" ]; then
            install -Dm644 "assets/icons/${size}x${size}.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/openvpn-connect.png"
        fi
    done
    install -Dm644 "assets/icons/app-icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openvpn-connect.png"

    # License
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << EOF
MIT License

The shim layer (src/) is MIT licensed.

The OpenVPN Connect application (resources/app/) is the property of
OpenVPN Inc. and subject to their terms of service.
See https://openvpn.net/terms/
EOF
}
