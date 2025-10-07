# Maintainer: Ludvig <artemludvig79@gmail.com>

pkgname=superlauncher-mc
pkgver=1.4.0.8
pkgrel=1
pkgdesc="SuperLauncherMC — Advanced Minecraft launcher with mod and server support (new design release)"
arch=('x86_64')
url="https://github.com/ludvig2457/SuperLauncherMC"
license=('GPL3')
depends=(
    'python'
    'python-pyqt6'
    'java-runtime'
)
makedepends=(
    'python-pip'
    'python-virtualenv'
)
source=(
    "$pkgname-$pkgver.tar.gz::file:///home/artem/Downloads/SuperLauncher/superlauncher-mc-$pkgver.tar.gz"
)
sha256sums=('SKIP')

package() {
    cd "$srcdir"

    # Установка директории лаунчера
    install -d "$pkgdir/usr/share/superlauncher-mc"
    cp -r SuperLauncher.py assets "$pkgdir/usr/share/superlauncher-mc/"

    # Добавляем шебанг для python3, если его нет
    if ! head -n 1 SuperLauncher.py | grep -q "^#\!"; then
        sed -i '1i#!/usr/bin/env python3' SuperLauncher.py
    fi

    # Создаём virtual environment
    python -m venv "$pkgdir/usr/share/superlauncher-mc/venv"

    # Устанавливаем библиотеки в venv
    "$pkgdir/usr/share/superlauncher-mc/venv/bin/python" -m pip install --upgrade pip
    "$pkgdir/usr/share/superlauncher-mc/venv/bin/python" -m pip install \
        minecraft-launcher-lib requests psutil pypresence packaging tqdm random-username

    # Создаём wrapper для запуска через venv напрямую
    cat <<EOF > "$pkgdir/usr/bin/superlauncher-mc"
#!/usr/bin/env bash
DIR="/usr/share/superlauncher-mc"
exec "\$DIR/venv/bin/python" "\$DIR/SuperLauncher.py" "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/superlauncher-mc"

    # Desktop-файл
    install -d "$pkgdir/usr/share/applications"
    cat <<EOF > "$pkgdir/usr/share/applications/superlauncher-mc.desktop"
[Desktop Entry]
Name=SuperLauncherMC
Comment=Advanced Minecraft Launcher with mod and server support
Exec=/usr/bin/superlauncher-mc
Icon=superlauncher
Type=Application
Categories=Game;
Terminal=false
EOF

    # Иконка
    install -Dm644 assets/icon.png "$pkgdir/usr/share/pixmaps/superlauncher.png"
}
