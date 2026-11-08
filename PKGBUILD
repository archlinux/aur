# Maintainer: Behnam Lal <dev at behnamlal dot xyz>
# Contributor: Daniele Basso <daniele05 dot bass at gmail dot com>
# Contributor: Zanny <lordzanny@gmail.com>

pkgname=oda-file-converter
pkgver=27.10
pkgrel=1
pkgdesc="Converts files between the .dwg and .dxf file formats"
arch=('x86_64')
url="https://www.opendesign.com/guestfiles/oda_file_converter"
license=('custom')
conflicts=('teigha-file-converter')
replaces=('teigha-file-converter')
depends=('hicolor-icon-theme' 'qt6-base' 'libglvnd' 'libx11' 'libxcb'
         'libxkbcommon-x11' 'fontconfig' 'freetype2' 'glib2')
options=('!strip')
source=("ODAFileConverter_QT6_lnxX64_11dll_${pkgver}.deb::https://www.opendesign.com/guestfiles/get?filename=ODAFileConverter_QT6_lnxX64_11dll_${pkgver}.deb"
        'oda-file-converter'
        'oda-file-converter.desktop'
        'LICENSE')
sha256sums=('c432002cc688f89ddf6a68ad68e877cd16da1d99ab8729386009c552cf73beb5'
            'c1a5bfca03b577a7f7e62dc41b4bfadd85941c5224628547d03ffa3358c3c2ac'
            '5fa2d6a8298bd9740dba27bf5c5af5c25536fc4b69a314f13517faba59f0db7b'
            'e94d9a6b54e6ce2c5e91454819aea622d45269b315cee7a4b89828386969e18a')
_ogname='ODAFileConverter'

package() {
    tar xJf 'data.tar.xz'

    # Upstream ships a private Qt6 (lib/, plugins/, qt.conf, translations/);
    # drop it and use the system qt6-base instead.
    install -d "$pkgdir/opt/$pkgname"
    cp -r --no-preserve=ownership "$srcdir/usr/bin/${_ogname}_${pkgver}.0.0/." "$pkgdir/opt/$pkgname/"
    rm -rf "$pkgdir/opt/$pkgname/"{AppRun,lib,plugins,translations,qt.conf}
    find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} +
    chmod 755 "$pkgdir/opt/$pkgname/$_ogname"

    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    for res in '16x16' '32x32' '64x64' '128x128'; do
        install -Dm644 "$srcdir/usr/share/icons/hicolor/$res/apps/$_ogname.png" "$pkgdir/usr/share/icons/hicolor/$res/apps/$pkgname.png"
    done

    # FreeCAD looks for "ODAFileConverter" (or the legacy "TeighaFileConverter")
    ln -s "$pkgname" "$pkgdir/usr/bin/$_ogname"
    ln -s "$pkgname" "$pkgdir/usr/bin/TeighaFileConverter"
}
