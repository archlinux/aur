# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=notedeck-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="The nostr browser"
arch=('x86_64' 'aarch64')
url="https://github.com/damus-io/notedeck" # https://damus.io/notedeck/install/
license=('GPL-3')
depends=('glibc')
options=(!strip)
source=("https://damus.io/notedeck/dl/v${pkgver}/notedeck_v${pkgver}-x64.deb")
sha256sums=('2511cea3d6ada4a579a1034ae521fc0df10722990655fefde77f7cf41a1e49eb')

package() {
    # Create package directory if it doesn't exist
    mkdir -p "$pkgdir"
    
    # Extract the .deb archive
    cd "$srcdir"
    ar x "../notedeck_v${pkgver}-x64.deb"
    
    # Extract data archive to the package directory
    tar -xf data.tar.xz -C "$pkgdir"
    
    # Clean up
    rm -f control.tar.xz data.tar.xz debian-binary
    
    # Create a menu entry if desktop files exist but weren't included
    if [ -f "$pkgdir/usr/bin/notedeck" ] && [ ! -d "$pkgdir/usr/share/applications" ]; then
        mkdir -p "$pkgdir/usr/share/applications"
        cat > "$pkgdir/usr/share/applications/notedeck.desktop" << EOF
[Desktop Entry]
Name=Notedeck
GenericName=The nostr browser
Exec=notedeck
Terminal=false
Type=Application
Categories=Utility;
EOF
    fi
}
