# Maintainer: Arunachalam-gojosaturo <aur@luna-ai>
pkgname=luna-ai
pkgver=2.1.0
pkgrel=1
pkgdesc="Luna OS: Autonomous Voice & Multimodal AI Operating System on Arch Linux by Arunachalam."
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/Luna-ai"
license=('MIT')
depends=('python' 'python-pip' 'nodejs' 'npm' 'playerctl' 'xdg-utils' 'android-tools')
makedepends=('git')
install=luna-ai.install
source=("luna-ai::git+https://github.com/Arunachalam-gojosaturo/Luna-ai.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/luna-ai"
    npm install
    npm run build
}

package() {
    cd "${srcdir}/luna-ai"

    # Install application bundle to /opt/luna-ai
    install -dm755 "${pkgdir}/opt/luna-ai"
    cp -r backend src dist package.json luna_desktop.py requirements.txt "${pkgdir}/opt/luna-ai/"

    # Install system executable wrappers
    install -dm755 "${pkgdir}/usr/bin"
    
    cat > "${pkgdir}/usr/bin/luna-ai" << 'EOF'
#!/usr/bin/env bash
PROJECT_DIR="/opt/luna-ai"
cd "$PROJECT_DIR"

if [ ! -d "$PROJECT_DIR/venv" ]; then
    python -m venv "$PROJECT_DIR/venv"
    "$PROJECT_DIR/venv/bin/pip" install -r "$PROJECT_DIR/requirements.txt" pywebview PyQt6 PyQt6-WebEngine qtpy
fi

exec "$PROJECT_DIR/venv/bin/python" "$PROJECT_DIR/luna_desktop.py" "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/luna-ai"
    ln -s /usr/bin/luna-ai "${pkgdir}/usr/bin/luna" 2>/dev/null || true

    # Desktop Icon
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    if [ -f "dist/vite.svg" ]; then
        install -Dm644 dist/vite.svg "${pkgdir}/usr/share/pixmaps/luna-ai.svg"
    fi

    # Desktop Entry
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/Luna-AI.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Luna AI
Comment=Autonomous Personal AI Operating System & Daily Companion
Exec=/usr/bin/luna-ai
Icon=/usr/share/pixmaps/luna-ai.svg
Terminal=false
Type=Application
Categories=Utility;Development;System;
Keywords=AI;Assistant;OperatingSystem;Hyprland;Luna;
DESKTOP
}
