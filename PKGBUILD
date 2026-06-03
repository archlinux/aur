# Maintainer: araujo791 <https://github.com/araujo791>
pkgname=machctrl
pkgver=2.0.2
pkgrel=1
pkgdesc="Hardware Monitor and Optimizer for Linux — CPU, GPU, RAM, Fans, Temperature | Requires KDE Plasma or GNOME"
arch=('x86_64')
url="https://github.com/araujo791/machctrl"
license=('MIT')
depends=(
    'python'
    'python-psutil'
    'python-websockets'
    'lm_sensors'
    'dmidecode'
)
makedepends=(
    'git'
    'nodejs'
    'npm'
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
    # Verifica se node/npm estão disponíveis
    if ! command -v node &>/dev/null; then
        echo "ERRO: nodejs não encontrado. Instale com: sudo pacman -S nodejs npm"
        exit 1
    fi
    npm install --prefer-offline
    npx vite build
    npx electron-builder build --linux dir
}

package() {
    cd "$srcdir/machctrl-main"

    # Instala linux-unpacked diretamente (sem AppImage, sem FUSE)
    install -dm755 "$pkgdir/opt/machctrl/app"
    cp -r dist-electron/linux-unpacked/. "$pkgdir/opt/machctrl/app/"
    # Torna todos os binários executáveis
    find "$pkgdir/opt/machctrl/app/" -maxdepth 1 -type f -exec chmod 755 {} \;

    # Backend Python
    install -Dm644 backend/machctrl_server.py "$pkgdir/opt/machctrl/backend/machctrl_server.py"

    # Launcher
    install -dm755 "$pkgdir/usr/local/bin"
    cat > "$pkgdir/usr/local/bin/machctrl" << 'LAUNCHER'
#!/bin/bash
# Suporte a Wayland e X11
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    WAYLAND_FLAGS="--enable-features=UseOzonePlatform --ozone-platform=wayland"
else
    WAYLAND_FLAGS=""
fi
BIN=$(ls /opt/machctrl/app/ | grep -iE "^machctrl$" | head -1)
[ -z "$BIN" ] && BIN=$(ls /opt/machctrl/app/ | grep -v "\." | head -1)
exec /opt/machctrl/app/$BIN $WAYLAND_FLAGS "$@"
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
