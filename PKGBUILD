# Maintainer: YOUNES-2-wq <YOUNES-2-wq@users.noreply.github.com>
pkgname=cachymonitor
pkgver=1.0.0
pkgrel=2
pkgdesc="Gaming-oriented system monitor: FPS, 1% low, frametime, CPU/GPU/RAM/VRAM via MangoHud"
arch=('any')
url="https://github.com/YOUNES-2-wq/cachymonitor"
license=('MIT')
depends=('python' 'pyside6')
optdepends=('mangohud: in-game stats (FPS, 1% low, frametime)'
            'nvidia-utils: NVIDIA GPU readings via nvidia-smi'
            'pciutils: GPU marketing name via lspci'
            'dmidecode: RAM type and speed (requires root)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a770b415b30770ea873eb4b9c9f68125bb0d418cbf12f1953c2d036913f1011d')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Application (le .py cherche son icone a cote de lui : on l'y installe aussi)
    install -Dm644 cachymonitor.py "$pkgdir/usr/share/cachymonitor/cachymonitor.py"
    install -Dm644 cachymonitor.svg "$pkgdir/usr/share/cachymonitor/cachymonitor.svg"

    # Lanceur en ligne de commande
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/cachymonitor" <<'EOF'
#!/bin/sh
exec python /usr/share/cachymonitor/cachymonitor.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/cachymonitor"

    # Icone du theme (pour le menu des applications)
    install -Dm644 cachymonitor.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/cachymonitor.svg"

    # Entree de menu (chemins systeme, pas de home code en dur)
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/cachymonitor.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=CachyMonitor
Comment=Gaming-oriented system monitor (FPS, 1% low, frametime, CPU/GPU/RAM/VRAM)
Exec=cachymonitor
Icon=cachymonitor
Terminal=false
Categories=System;Monitor;
EOF

    # Licence
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
