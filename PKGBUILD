# Maintainer: MLM-stuff gfxoxinzh@mozmail.com
pkgname=inkscape-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Professional vector graphics editor - Prebuilt AppImage"
arch=('x86_64')
url="https://inkscape.org"
license=('GPL-2.0-or-later')
depends=('fuse2' 'hicolor-icon-theme')
optdepends=('python: for extensions'
            'python-numpy: for some extensions'
            'python-lxml: for some extensions'
            'fig2dev: xfig import'
            'gvfs: file system support'
            'pstoedit: PostScript support')
provides=('inkscape')
conflicts=('inkscape')
options=('!strip')
source=("inkscape-${pkgver}.AppImage::https://inkscape.org/gallery/item/56343/Inkscape-ebf0e94-x86_64.AppImage"
        "inkscape.desktop")
sha256sums=('99c333c03ce77e207942ddcd5c8a5b77cde89959a23651bc7872ae880cf4ba6b'
            'SKIP')
noextract=("inkscape-${pkgver}.AppImage")

prepare() {
    chmod +x "inkscape-${pkgver}.AppImage"
    ./inkscape-${pkgver}.AppImage --appimage-extract >/dev/null 2>&1 || true
}

package() {
    install -Dm755 "inkscape-${pkgver}.AppImage" "$pkgdir/opt/inkscape/inkscape.AppImage"
    
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/inkscape" << 'WRAPPER'
#!/bin/bash
exec /opt/inkscape/inkscape.AppImage "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/inkscape"
    
    install -Dm644 "$srcdir/inkscape.desktop" "$pkgdir/usr/share/applications/org.inkscape.Inkscape.desktop"
    
    if [[ -d "$srcdir/squashfs-root/usr/share/icons" ]]; then
        install -dm755 "$pkgdir/usr/share/icons/hicolor"
        cp -r "$srcdir/squashfs-root/usr/share/icons/hicolor"/* "$pkgdir/usr/share/icons/hicolor/"
    fi
    
    if [[ -f "$srcdir/squashfs-root/org.inkscape.Inkscape.svg" ]]; then
        install -Dm644 "$srcdir/squashfs-root/org.inkscape.Inkscape.svg" \
            "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.inkscape.Inkscape.svg"
    fi
}
