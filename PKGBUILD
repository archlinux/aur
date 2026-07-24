# Maintainer: Arunachalam <arunachalam@example.com>
pkgname=luna-ai
pkgver=2.1.0
pkgrel=1
pkgdesc="Autonomous Personal AI Operating System & Desktop Assistant for Arch Linux"
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/Luna-ai"
license=('MIT')
depends=(
    'nodejs'
    'npm'
    'python'
    'python-pip'
    'python-fastapi'
    'uvicorn'
    'python-pydantic'
    'python-dotenv'
    'python-requests'
    'python-psutil'
    'python-httpx'
    'python-websockets'
    'python-pyqt6'
    'python-pyqt6-webengine'
    'mpv'
    'xdg-utils'
    'polkit'
    'qt6-webengine'
)
optdepends=(
    'scrcpy: Wireless Android screen mirroring'
    'android-tools: ADB device control'
    'playerctl: Media playback automation'
    'zenity: Native GTK folder chooser dialog'
    'kdialog: Native KDE folder chooser dialog'
)
source=("git+https://github.com/Arunachalam-gojosaturo/Luna-ai.git#tag=v2.1.0")
sha256sums=('SKIP')

build() {
    cd "$srcdir/Luna-ai"
    npm install
    npm run build
}

package() {
    cd "$srcdir/Luna-ai"

    # Installation directories
    install -d "$pkgdir/opt/luna-ai"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"

    # Copy core codebase
    cp -r backend assets cli.py cli_config.py cli_examples.py cli_utils.py \
          generate_reports.py luna_cli_enhanced.py luna_desktop.py server.py \
          package.json pyproject.toml requirements.txt public src dist node_modules "$pkgdir/opt/luna-ai/"

    # Install launcher script for GUI
    cat << 'EOF' > "$pkgdir/usr/bin/luna-ai"
#!/usr/bin/env bash
cd /opt/luna-ai
exec python3 luna_desktop.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/luna-ai"

    # Install short command symlink
    ln -s /usr/bin/luna-ai "$pkgdir/usr/bin/luna"

    # Install CLI launcher script
    cat << 'EOF' > "$pkgdir/usr/bin/luna-cli"
#!/usr/bin/env bash
cd /opt/luna-ai
exec python3 luna_cli_enhanced.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/luna-cli"

    # Install Desktop Entry
    cat << 'EOF' > "$pkgdir/usr/share/applications/Luna-AI.desktop"
[Desktop Entry]
Name=Luna AI
Comment=Autonomous Personal AI Operating System & Daily Companion
Exec=/usr/bin/luna-ai
Icon=/opt/luna-ai/public/deskopticon.png
Terminal=false
Type=Application
Categories=Utility;Development;System;
Keywords=AI;Assistant;OperatingSystem;Hyprland;Luna;
EOF
}
