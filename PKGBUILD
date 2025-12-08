# Maintainer: Trex099 <trex099@github.com>
pkgname=velocity-bridge
pkgver=1.0.2
pkgrel=1
pkgdesc="iOS to Linux Clipboard Sync - Copy on iPhone, paste on Linux"
arch=('any')
url="https://github.com/Trex099/Velocity-Bridge"
license=('MIT')
depends=(
    'python>=3.10'
    'python-pip'
    'python-fastapi'
    'python-uvicorn'
    'python-pillow'
    'python-qrcode'
    'python-pystray'
    'wl-clipboard'
    'libnotify'
    'tk'
)
optdepends=(
    'xclip: X11 clipboard support'
    'avahi: mDNS hostname support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Trex099/Velocity-Bridge/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "Velocity-Bridge-${pkgver}"
    
    # Create directories
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -dm755 "${pkgdir}/usr/lib/systemd/user"
    
    # Install application files
    install -Dm644 main.py "${pkgdir}/usr/share/${pkgname}/main.py"
    install -Dm644 requirements.txt "${pkgdir}/usr/share/${pkgname}/requirements.txt"
    cp -r gui/* "${pkgdir}/usr/share/${pkgname}/"
    
    # Install icon
    install -Dm644 gui/velocity-icon-final.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Create launcher script
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/bash
cd /usr/share/velocity-bridge
exec python3 app.py "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
    
    # Create desktop file
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=Velocity Bridge
Comment=iOS to Linux Clipboard Sync
Exec=${pkgname}
Icon=${pkgname}
Type=Application
Categories=Utility;Network;
Terminal=false
EOF
    
    # Create systemd user service
    cat > "${pkgdir}/usr/lib/systemd/user/velocity.service" << EOF
[Unit]
Description=Velocity Bridge - iOS to Linux Clipboard Sync
After=network.target

[Service]
Type=simple
WorkingDirectory=/usr/share/${pkgname}
ExecStart=/usr/bin/python3 -m uvicorn main:app --host 0.0.0.0 --port 8080
Restart=always
RestartSec=5

[Install]
WantedBy=default.target
EOF
}

post_install() {
    echo ">>> Velocity Bridge installed!"
    echo ">>> Run 'velocity-bridge' or find it in your applications menu."
    echo ">>> For headless mode: systemctl --user enable --now velocity"
    
    # Install additional Python dependencies if needed
    pip install --user customtkinter 2>/dev/null || true
}
