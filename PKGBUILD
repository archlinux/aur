# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=notedeck-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="The nostr browser"
arch=('x86_64' 'aarch64')
url="https://github.com/damus-io/notedeck" # https://damus.io/notedeck/install/
license=('GPL-3')
depends=('glibc')
options=(!strip)
source_x86_64=("https://damus.io/notedeck/dl/v${pkgver}/notedeck_v${pkgver}-x64.deb")
source_aarch64=("https://damus.io/notedeck/dl/v${pkgver}/notedeck_v${pkgver}-arm64.deb")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    # Create package directory if it doesn't exist
    mkdir -p "$pkgdir"

    # Extract the .deb archive
    cd "$srcdir"
    # ar x "../notedeck_v${pkgver}-x64.deb"
    ar x "${srcdir}/notedeck_v${pkgver}-"*".deb"

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
