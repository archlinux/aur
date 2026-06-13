# Maintainer: Vanion <aur at vanion dot de>
pkgname=genesis-rpg-bin
pkgver=7.0.5
pkgrel=1
pkgdesc="RPG character management for Splittermond, Space 1889 and more"
arch=('x86_64')
url="https://www.rpgframework.de"
license=('LicenseRef-Genesis')
depends=('libx11' 'libxi' 'libxtst' 'libxext' 'libxrender' 'zlib')
optdepends=('alsa-lib: Audio-Ausgabe')
makedepends=('libarchive') # für bsdtar
options=(!strip !debug)
source=("https://www.rpgframework.de/downloads/linux/genesis-${pkgver}-1.${CARCH}.rpm")
sha256sums=('70d9dbc224e8ebf647b41ad186bca7fb0efa9ab99ec3b07401bf886c9ab0bec1') 

prepare() {
    cd "$srcdir"
    mkdir -p extract
    cd extract
    bsdtar -xf "$srcdir/genesis-${pkgver}-1.${CARCH}.rpm" 
}

package() {
    cd "$srcdir/extract"

    # /opt/genesis installieren
    install -d "$pkgdir/opt"
    cp -a opt/genesis "$pkgdir/opt/"

    # Symlink für Startskript
    install -d "$pkgdir/usr/bin"
    ln -sf /opt/genesis/bin/Genesis "$pkgdir/usr/bin/genesis"
    ln -sf /opt/genesis/bin/Genesis-Staging "$pkgdir/usr/bin/genesis-staging"
    ln -sf /opt/genesis/bin/Genesis-HiDPI "$pkgdir/usr/bin/genesis-hidpi"
    ln -sf /opt/genesis/bin/Genesis-Staging-HiDPI "$pkgdir/usr/bin/genesis-staging-hidpi"

    # Desktop-Eintrag (Metadaten aus dem mitgelieferten genesis-Genesis.desktop,
    # aber Exec/Icon über die installierten Symlinks und Terminal=false)
    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/genesis.desktop" <<EOF
[Desktop Entry]
Name=Genesis
GenericName=RPG Character Management
Comment=A RPG character management software
Comment[de]=Eine Software zur Verwaltung von Rollenspiel-Charakteren
Exec=genesis
TryExec=genesis
Icon=genesis
Terminal=false
Type=Application
Keywords=Genesis;RPG;Roleplaying;
Categories=Game;
StartupNotify=true
EOF

    # Icon (380x380, ungewöhnliche Größe -> pixmaps, per Icon-Name referenziert)
    install -Dm644 opt/genesis/lib/Genesis.png "$pkgdir/usr/share/pixmaps/genesis.png"

    # Genesis ist proprietär und liefert keine eigene Lizenzdatei mit -> den
    # vom Autor bestätigten "No License"-Status als Lizenzhinweis dokumentieren.
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<EOF
Genesis – RPG Framework
https://www.rpgframework.de

Proprietäre Freeware, bewusst ohne Open-Source- oder Creative-Commons-Lizenz
("No License", Auskunft des Autors). Genesis enthält Daten, deren Rechte nicht
weitergegeben werden dürfen; alle Rechte vorbehalten. Bezug und Weitergabe
ausschließlich über die offizielle Website.
EOF
}
