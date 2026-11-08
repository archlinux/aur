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
depends=('hicolor-icon-theme' 'libglvnd' 'libx11' 'libxcb' 'libxkbcommon-x11'
         'dbus' 'fontconfig' 'freetype2' 'glib2')
options=('!strip')
source=("ODAFileConverter_QT6_lnxX64_11dll_${pkgver}.deb::https://www.opendesign.com/guestfiles/get?filename=ODAFileConverter_QT6_lnxX64_11dll_${pkgver}.deb"
        'oda-file-converter'
        'oda-file-converter.desktop')
md5sums=('4099d7b002eceadb007bf0dfa76b1128'
         '6d8843a38923c50ac9c98c70ae34e327'
         'c52b1dc291e81a7cb44cfed76c39c610')
_ogname='ODAFileConverter'

package() {
    tar xJf 'data.tar.xz'

    # The package bundles its own Qt6 (lib/, plugins/, qt.conf) and finds it
    # relative to the executable, so install the whole tree as-is.
    install -d "$pkgdir/opt/$pkgname"
    cp -r --no-preserve=ownership "$srcdir/usr/bin/${_ogname}_${pkgver}.0.0/." "$pkgdir/opt/$pkgname/"
    rm -f "$pkgdir/opt/$pkgname/AppRun"
    find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} +
    chmod 755 "$pkgdir/opt/$pkgname/$_ogname"

    install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    for res in '16x16' '32x32' '64x64' '128x128'; do
        install -Dm644 "$srcdir/usr/share/icons/hicolor/$res/apps/$_ogname.png" "$pkgdir/usr/share/icons/hicolor/$res/apps/$pkgname.png"
    done

    # FreeCAD looks for "ODAFileConverter" (or the legacy "TeighaFileConverter")
    ln -s "$pkgname" "$pkgdir/usr/bin/$_ogname"
    ln -s "$pkgname" "$pkgdir/usr/bin/TeighaFileConverter"
}
