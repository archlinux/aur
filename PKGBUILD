# Maintainer: araujo791 <https://github.com/araujo791>
pkgname=machctrl
pkgver=2.0.0
pkgrel=1
pkgdesc="Monitor e Otimizador de Hardware para Linux — CPU, GPU, RAM, Fans, Temperatura"
arch=('x86_64')
url="https://github.com/araujo791/machctrl"
license=('MIT')
depends=(
    'python'
    'python-psutil'
    'python-websockets'
    'lm_sensors'
    'dmidecode'
    'fuse2'
    'nodejs'
)
makedepends=(
    'npm'
    'git'
)
optdepends=(
    'nvidia-utils: suporte a GPU NVIDIA (fan control, temperatura)'
    'nvidia-settings: controle avançado de fan NVIDIA'
)

# ⚠️  Interface gráfica requer ambiente de desktop com suporte a Electron:
#     KDE Plasma ou GNOME são os ambientes testados e suportados.
#     Ambientes minimalistas (i3, sway, etc) podem exigir configuração adicional.
provides=('machctrl')
conflicts=('machctrl-git' 'machctrl-bin')
install=machctrl.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/araujo791/machctrl/archive/refs/heads/main.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/machctrl-main"
    npm install --prefer-offline
    npm run build:appimage
}

package() {
    cd "$srcdir/machctrl-main"

    # Diretório de instalação
    install -dm755 "$pkgdir/opt/machctrl/backend"

    # AppImage
    local appimage
    appimage=$(find dist-electron -name '*.AppImage' | head -1)
    install -Dm755 "$appimage" "$pkgdir/opt/machctrl/MachCtrl.AppImage"

    # Backend Python
    install -Dm644 backend/machctrl_server.py "$pkgdir/opt/machctrl/backend/machctrl_server.py"

    # Launcher
    install -dm755 "$pkgdir/usr/local/bin"
    cat > "$pkgdir/usr/local/bin/machctrl" << 'LAUNCHER'
#!/bin/bash
exec /opt/machctrl/MachCtrl.AppImage "$@"
LAUNCHER
    chmod 755 "$pkgdir/usr/local/bin/machctrl"

    # Ícone
    if [[ -f src/assets/app-icon.png ]]; then
        install -Dm644 src/assets/app-icon.png \
            "$pkgdir/usr/share/pixmaps/machctrl.png"
        install -Dm644 src/assets/app-icon.png \
            "$pkgdir/usr/share/icons/hicolor/256x256/apps/machctrl.png"
    fi

    # .desktop
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/machctrl.desktop" << 'DESKTOP'
[Desktop Entry]
Name=MachCtrl
GenericName=Monitor de Hardware
Comment=Monitor e Otimizador de Hardware para Linux
Exec=/usr/local/bin/machctrl
Icon=machctrl
Terminal=false
Type=Application
Categories=System;Monitor;
Keywords=hardware;cpu;gpu;ram;monitor;temperatura;fans;
StartupNotify=true
DESKTOP

    # Serviço systemd
    install -dm755 "$pkgdir/usr/lib/systemd/system"
    cat > "$pkgdir/usr/lib/systemd/system/machctrl-backend.service" << 'SERVICE'
[Unit]
Description=MachCtrl Backend
After=network.target
Wants=lm-sensors.service

[Service]
Type=simple
ExecStart=/usr/bin/python3 /opt/machctrl/backend/machctrl_server.py
WorkingDirectory=/opt/machctrl
Restart=on-failure
RestartSec=5
User=root
Environment=PYTHONUNBUFFERED=1
StandardOutput=journal
StandardError=journal
SyslogIdentifier=machctrl

[Install]
WantedBy=multi-user.target
SERVICE

    # sudoers para dmidecode (leitura de RAM)
    install -dm750 "$pkgdir/etc/sudoers.d"
    echo "root ALL=(ALL) NOPASSWD: /usr/sbin/dmidecode" \
        > "$pkgdir/etc/sudoers.d/machctrl"
    chmod 440 "$pkgdir/etc/sudoers.d/machctrl"
}
