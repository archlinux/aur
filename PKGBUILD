# Maintainer: YOUNES-2-wq <YOUNES-2-wq@users.noreply.github.com>
pkgname=cachymonitor
pkgver=1.5.6
pkgrel=1
pkgdesc="Gaming-oriented system monitor: FPS, 1% low, frametime, CPU/GPU/RAM/VRAM via MangoHud"
arch=('any')
url="https://github.com/YOUNES-2-wq/cachymonitor-linux"
license=('MIT')
depends=('python' 'pyside6')
optdepends=('mangohud: in-game stats (FPS, 1% low, frametime)'
            'nvidia-utils: NVIDIA GPU readings via nvidia-smi'
            'pciutils: GPU marketing name via lspci'
            'dmidecode: RAM type and speed (requires root)'
            'yay: in-app updates (or paru)'
            'polkit: password prompt for in-app updates')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec88dacce3a883cd7929d2e687415dc8c559dc6ea7044cd4e738c2bd17a8af0a')

package() {
    cd "$srcdir/$pkgname-linux-$pkgver"

    # Application (le .py cherche son icone a cote de lui : on l'y installe aussi)
    install -Dm644 cachymonitor.py "$pkgdir/usr/share/cachymonitor/cachymonitor.py"
    # Le code est reparti entre cachymonitor.py et le dossier cachymon/
    install -Dm644 cachymon/*.py -t "$pkgdir/usr/share/cachymonitor/cachymon/"
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

    # Fiche AppStream (descriptions et captures dans les logitheques, ex. CachyOS Package Installer)
    install -Dm644 packaging/aur/io.github.YOUNES_2_wq.CachyMonitor.metainfo.xml \
        "$pkgdir/usr/share/metainfo/io.github.YOUNES_2_wq.CachyMonitor.metainfo.xml"
    # Meme fiche au format catalogue : le CachyOS Package Installer ne lit que celui-la
    install -Dm644 packaging/aur/io.github.YOUNES_2_wq.CachyMonitor.catalog.xml \
        "$pkgdir/usr/share/swcatalog/xml/io.github.YOUNES_2_wq.CachyMonitor.xml"

    # Licence
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
