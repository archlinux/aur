# Maintainer: Cristiandis <pizzaoven@izzoserver.top>
pkgname=pizzaoven-bin
pkgver=1.1.5
pkgrel=1
pkgdesc="Cross-platform mod manager for Pizza Tower"
arch=('x86_64')
url="https://github.com/Cristiandis/PizzaOven-Avalonia"
license=('GPL3')
depends=('dotnet-runtime-8.0')
provides=('pizzaoven')
conflicts=('pizzaoven')
options=('!strip')
source=("PizzaOven-linux-x64.tar.gz::https://github.com/Cristiandis/PizzaOven-Avalonia/releases/download/v$pkgver/PizzaOven-linux-x64.tar.gz")
sha256sums=('73f452a04a90eeb5f0c45cdbcb3363ea87ca57a8eee95a6f59262ee15abd47ad')

package() {
    install -Dm755 "$srcdir/PizzaOven" "$pkgdir/usr/lib/pizzaoven/PizzaOven"

    # Themes
    if [ -d "$srcdir/Themes" ]; then
        find "$srcdir/Themes" -name "*.potheme" | while read -r f; do
            install -Dm644 "$f" "$pkgdir/usr/lib/pizzaoven/Themes/$(basename "$f")"
        done
    fi

    # GMLoader
    if [ -d "$srcdir/GMLOADER-windows" ]; then
        find "$srcdir/GMLOADER-windows" -type f | while read -r f; do
            rel="${f#$srcdir/}"
            install -Dm755 "$f" "$pkgdir/usr/lib/pizzaoven/$rel"
        done
    fi

    if [ -d "$srcdir/GMLOADER-linux" ]; then
        find "$srcdir/GMLOADER-linux" -type f | while read -r f; do
            rel="${f#$srcdir/}"
            install -Dm755 "$f" "$pkgdir/usr/lib/pizzaoven/$rel"
        done
    fi

    # Dependencies
   if [ -d "$srcdir/Dependencies" ]; then
        find "$srcdir/Dependencies" -type f | while read -r f; do
            rel="${f#$srcdir/}"
            install -Dm644 "$f" "$pkgdir/usr/lib/pizzaoven/$rel"
        done

        if [ -f "$pkgdir/usr/lib/pizzaoven/Dependencies/DepotDownloader-linux/DepotDownloader" ]; then
            chmod 755 "$pkgdir/usr/lib/pizzaoven/Dependencies/DepotDownloader-linux/DepotDownloader"
        fi

        if [ -f "$pkgdir/usr/lib/pizzaoven/Dependencies/xdelta3" ]; then
            chmod 755 "$pkgdir/usr/lib/pizzaoven/Dependencies/xdelta3"
        fi
    fi

    # Wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/pizzaoven" << 'WRAPPER'
#!/bin/sh
exec /usr/lib/pizzaoven/PizzaOven "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/pizzaoven"

    # App desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/pizzaoven.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Pizza Oven+
Comment=Mod manager for Pizza Tower
Exec=/usr/bin/pizzaoven
Icon=pizzaoven
Type=Application
Categories=Game;
DESKTOP
    # URI handler desktop entry
    cat > "$pkgdir/usr/share/applications/pizzaoven-handler.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Pizza Oven+
Exec=/usr/bin/pizzaoven -download %u
Type=Application
NoDisplay=true
MimeType=x-scheme-handler/pizzaovenplus;
DESKTOP

    install -Dm644 "$srcdir/pizzaoven.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/pizzaoven.png"
}
