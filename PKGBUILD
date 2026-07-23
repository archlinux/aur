# Maintainer: YOUNES-2-wq <YOUNES-2-wq@users.noreply.github.com>
pkgname=cachymonitor
pkgver=1.0.0
pkgrel=1
pkgdesc="Moniteur systeme oriente jeu : FPS, 1% low, frametime, CPU/GPU/RAM/VRAM, base sur MangoHud"
arch=('any')
url="https://github.com/YOUNES-2-wq/cachymonitor"
license=('MIT')
depends=('python' 'pyside6')
optdepends=('mangohud: statistiques en jeu (FPS, 1% low, frametime)'
            'nvidia-utils: lecture GPU NVIDIA via nvidia-smi'
            'pciutils: nom commercial du GPU via lspci'
            'dmidecode: type et vitesse de la RAM (necessite les droits root)')
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
Comment=Moniteur systeme oriente jeu (FPS, 1% low, frametime, CPU/GPU/RAM/VRAM)
Exec=cachymonitor
Icon=cachymonitor
Terminal=false
Categories=System;Monitor;
EOF

    # Licence
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
