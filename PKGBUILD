#Maintainer: Musikolo<musikolo {at} hotmail [dot] com>
#Contributor: Martin špelina<shpelda [at]gmail[dot]com>
pkgname=dbvis
pkgver=25.3
__pkgver_underscore=25_3
pkgrel=1
pkgdesc="DbVisualizer free - The Universal Database Tool."
url="https://www.dbvis.com/"
license=('custom')
arch=('any')
depends=('java-runtime>=21')
makedepends=(coreutils sed unzip)
source=('https://dbvis.com/product_download/'$pkgname'-'$pkgver'/media/'$pkgname'_linux_'$__pkgver_underscore'.tar.gz')
sha256sums=('36fb75a344219d7ad354d6f1dcbfce4f17d0b1eeb08b90ed858e1ac22d70f0e3')

package() {

    msg2 "Relocating files..."
    mkdir -p "$pkgdir/opt"
    mv "$srcdir/DbVisualizer" "$pkgdir/opt/$pkgname"
    chmod a+x "$pkgdir/opt/$pkgname/dbvisgui.sh"
    mkdir -p "$pkgdir/usr/share/$pkgname"
    mv "$pkgdir/opt/$pkgname/doc" "$pkgdir/usr/share/$pkgname"
    mv "$pkgdir/opt/$pkgname/README.txt" "$pkgdir/usr/share/$pkgname/doc"
    chmod 644 "$pkgdir/opt/$pkgname/.install4j/i4jempty.ttf"

    msg2 "Installing app icon..."
    __dbvis_icon_dir="$pkgdir/usr/share/icons/hicolor/scalable/apps"
    mkdir -p "$__dbvis_icon_dir"
    unzip -o -j -q "$pkgdir/opt/$pkgname/lib/dbvis.jar" "images/lucide/dbvis-icon.svg" -d "$__dbvis_icon_dir"

    msg2 "Creating a .desktop file..."
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    __dbvis_desktop=/usr/share/applications/dbvis.desktop
    mkdir -p `dirname $pkgdir/$__dbvis_desktop`

    cat <<EOF > "$pkgdir/$__dbvis_desktop"
[Desktop Entry]
Type=Application
Name=DbVisualizer
Version=$pkgver
GenericName=The Universal Database Tool
Comment=$pkgdesc
Exec=/opt/$pkgname/dbvisgui.sh
Icon=${pkgname}-icon
Terminal=false
Categories=Development
StartupWMClass=com-onseven-dbvis-DbVisualizerGUI
EOF
}
