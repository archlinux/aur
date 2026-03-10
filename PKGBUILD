# Maintainer: Regaan <contact@rothackers.com>
pkgname=basilisk-desktop-bin
pkgver=1.0.7
pkgrel=2
pkgdesc="Open-source AI/LLM red teaming desktop app with 29 attack modules, genetic prompt evolution (SPE-NL), OWASP LLM Top 10 coverage, and 5 report formats. Built by Regaan Independent Security Researcher."
arch=('x86_64')
url="https://basilisk.rothackers.com"
license=('MIT')
depends=('zlib' 'hicolor-icon-theme' 'libglvnd')
provides=('basilisk-desktop')
conflicts=('basilisk-desktop')
options=('!debug' '!strip')
source=("basilisk-${pkgver}.AppImage::https://github.com/regaan/basilisk/releases/download/v${pkgver}/basilisk-${pkgver}.AppImage")
sha256sums=('SKIP')

package() {
    # Make AppImage executable
    chmod +x "${srcdir}/basilisk-${pkgver}.AppImage"

    # Extract AppImage into /opt/basilisk
    "${srcdir}/basilisk-${pkgver}.AppImage" --appimage-extract
    install -d "${pkgdir}/opt"
    mv squashfs-root "${pkgdir}/opt/basilisk"

    # Set proper permissions on extracted files
    find "${pkgdir}/opt/basilisk" -type d -exec chmod 755 {} +
    find "${pkgdir}/opt/basilisk" -type f -exec chmod 644 {} +
    chmod 755 "${pkgdir}/opt/basilisk/AppRun"
    chmod 755 "${pkgdir}/opt/basilisk/basilisk"
    chmod 755 "${pkgdir}/opt/basilisk/chrome-sandbox"
    chmod 755 "${pkgdir}/opt/basilisk/chrome_crashpad_handler"
    chmod 755 "${pkgdir}/opt/basilisk/resources/bin/basilisk-backend"
    # Make all .so files executable
    find "${pkgdir}/opt/basilisk" -name '*.so*' -exec chmod 755 {} +

    # Create wrapper script
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/basilisk-desktop" <<'EOF'
#!/bin/bash
exec /opt/basilisk/basilisk --no-sandbox --disable-gpu-sandbox --ozone-platform-hint=auto "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/basilisk-desktop"

    # Install desktop entry
    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/basilisk-desktop.desktop" <<EOF
[Desktop Entry]
Name=Basilisk
Comment=AI/LLM Red Teaming Framework with Genetic Prompt Evolution
Exec=/usr/bin/basilisk-desktop
Icon=basilisk
Terminal=false
Type=Application
Categories=Development;Security;
Keywords=AI;LLM;Security;Red Team;Pentesting;OWASP;
StartupWMClass=basilisk
EOF

    # Install icons
    for size in 16 32 48 64 128 256 512; do
        install -d "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        if [ -f "${pkgdir}/opt/basilisk/usr/share/icons/hicolor/${size}x${size}/apps/basilisk.png" ]; then
            ln -s "/opt/basilisk/usr/share/icons/hicolor/${size}x${size}/apps/basilisk.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/basilisk.png"
        fi
    done

    # Fallback icon
    if [ -f "${pkgdir}/opt/basilisk/basilisk.png" ]; then
        install -Dm644 "${pkgdir}/opt/basilisk/basilisk.png" \
            "${pkgdir}/usr/share/icons/hicolor/512x512/apps/basilisk.png"
    fi
}
