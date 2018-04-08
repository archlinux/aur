#Maintainer: Musikolo<musikolo {at} hotmail [dot] com>
#Contributor: Martin špelina<shpelda [at]gmail[dot]com>
pkgname=dbvis
pkgver=10.0.10
__pkgver_underscore=10_0_10
pkgrel=1
pkgdesc="DbVisualizer free - The Universal Database Tool"
url="http://www.dbvis.com/"
license=('custom')
arch=('any')
depends=('java-runtime')
makedepends=(coreutils sed unzip)
source=('http://www.dbvis.com/product_download/'$pkgname'-'$pkgver'/media/'$pkgname'_unix_'$__pkgver_underscore'.tar.gz')
sha256sums=('fcea75c2afa954c7fdd5d80b6c180056c1907ac2cdc2e61f85a643eb063d7b4a')

package() {

    msg2 "Relocating files..."
    mkdir -p "$pkgdir/opt"
    mv "$srcdir/DbVisualizer" "$pkgdir/opt/$pkgname"
    mkdir -p "$pkgdir/usr/share/$pkgname"
    mv "$pkgdir/opt/$pkgname/doc" "$pkgdir/usr/share/$pkgname"
    mv "$pkgdir/opt/$pkgname/README.txt" "$pkgdir/usr/share/$pkgname/doc"

    msg2 "Installing icons..."
    __dbvis_icon=/usr/share/icons/hicolor/@@RESOLUTION@@/apps/$pkgname.png;
    __dbvis_temp=/tmp/dbvis.pkgbuild.$$
    unzip -o -j -q "$pkgdir/opt/$pkgname/lib/dbvis.jar" "images/ix3/dbvis-icon*.png" -d $__dbvis_temp
    rm $__dbvis_temp/{*@2x.png,*white.png}
    for i in $__dbvis_temp/*;do
        __dbvis_icon_source=`basename $i`
        __dbvis_icon_resolution=`echo $__dbvis_icon_source | sed 's/.*dbvis-icon\([^.]*\)\.png/\1/g'`;
        __dbvis_icon_resolved=`echo $__dbvis_icon | sed 's/@@RESOLUTION@@/'$__dbvis_icon_resolution'/g'`
        mkdir -p `dirname $pkgdir/$__dbvis_icon_resolved`;
        mv $i $pkgdir/$__dbvis_icon_resolved
        chmod 644 $pkgdir/$__dbvis_icon_resolved
    done;
    rm -rf $__dbvis_temp

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
Exec=/usr/bin/$pkgname
Icon=$pkgname
Terminal=false
Categories=Development
StartupWMClass=com-onseven-dbvis-DbVisualizerGUI
EOF
}
