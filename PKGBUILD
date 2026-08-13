# Maintainer: arsalan rezazadeh  <arsalanrezazadeh4@gmail.com.com>
pkgname=whitevpn-desktop
pkgver=1.0.16
pkgrel=1
pkgdesc="WhiteVpn desktop client"
arch=('x86_64' 'aarch64')
url="https://github.com/WhiteDNS/WhiteVPN-Desktop"
license=('custom:WhiteDNS')
depends=('ca-certificates' 'gtk3' 'webkit2gtk-4.1')
source_x86_64=("https://github.com/WhiteDNS/WhiteVPN-Desktop/releases/download/v${pkgver}/WhiteVPN-Desktop-${pkgver}-linux-amd64-webkit41.tar.gz"
        "whitevpn-desktop.desktop"
        "whitevpn-desktop.png")
source_aarch64=("https://github.com/WhiteDNS/WhiteVPN-Desktop/releases/download/v${pkgver}/WhiteVPN-Desktop-${pkgver}-linux-arm64-webkit41.tar.gz"
        "whitevpn-desktop.desktop"
        "whitevpn-desktop.png")
sha256sums_x86_64=('642bdda072adf4bbaff5dc33eeb1f9d708ddb0c1f728539182b155cab0ac0292'
        'SKIP'
        'SKIP')
sha256sums_aarch64=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5'
        'SKIP'
        'SKIP')

package() {
    cd "${srcdir}"
    
    # Install the binary
    install -Dm755 "WhiteVPN Desktop" "${pkgdir}/opt/${pkgname}/WhiteVPN Desktop"
    
    # Install wrapper script with Wayland support
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/sh
# Enable Wayland backend if available, fallback to X11
export GDK_BACKEND="${GDK_BACKEND:-wayland,x11}"
exec /opt/whitevpn-desktop/"WhiteVPN Desktop" "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"
    
    # Install desktop entry
    install -Dm644 "${srcdir}/whitevpn-desktop.desktop" "${pkgdir}/usr/share/applications/whitevpn-desktop.desktop"
    
    # Install icon
    install -Dm644 "${srcdir}/whitevpn-desktop.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/whitevpn-desktop.png"
    
    # Install license
    if [ -f "README-Linux.txt" ]; then
        install -Dm644 "README-Linux.txt" "${pkgdir}/usr/share/licenses/${pkgname}/README-Linux.txt"
    fi
}
