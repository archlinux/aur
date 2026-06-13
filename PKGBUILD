# Maintainer: Vanion <aur at vanion dot de>
pkgname=genesis-rpg-bin
pkgver=7.0.5
pkgrel=1
pkgdesc="An RPG character management software with support for Splittermond, Space 1889, and other characters."
arch=('x86_64')
url="https://www.rpgframework.de"
license=('custom')
makedepends=('libarchive') # für bsdtar
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

    # Desktop-Eintrag
    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/genesis.desktop" <<EOF
[Desktop Entry]
Name=Genesis
Exec=genesis
Icon=/usr/share/pixmaps/genesis.png
Type=Application
Categories=Game;Utility;
EOF

    # Icon
    install -d "$pkgdir/usr/share/pixmaps"
    cp -a opt/genesis/lib/Genesis.png "$pkgdir/usr/share/pixmaps/genesis.png"

    # Lizenzdateien kopieren (falls vorhanden)
    if [[ -d opt/genesis/lib/runtime/legal ]]; then
        install -d "$pkgdir/usr/share/licenses/$pkgname"
        cp -a opt/genesis/lib/runtime/legal/* "$pkgdir/usr/share/licenses/$pkgname/"
    fi
}
