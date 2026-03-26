# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026

pkgname=maya-bifrost
pkgver=3.0.0.1
pkgrel=1
pkgdesc='Autodesk Maya Bifrost Plugin'
arch=('x86_64')
url='https://area.autodesk.com/bifrost/'
license=('custom')
depends=('maya>=2026' 'maya<2027.0')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://Bifrost_${pkgver}_Maya${_mayaver}_Linux.run")
b2sums=('ab1aa18564eb99404e6503b27f5546ea87bc1c9cc257dbc487822423c98a9be053587aba69ae6316ffa1ffd0f4e354c37c603c87a54e90ff737a3531e1fa608c')

options=(!strip)

prepare() {
    rm --force ./*.rpm
    chmod +x ./Bifrost_${pkgver}_Maya${_mayaver}_Linux.run
    ./Bifrost_${pkgver}_Maya${_mayaver}_Linux.run --tar xvf
    echo 'Extracting rpm...'
    bsdtar -xf *.rpm
    sed -i "s|<BIFROST_DIR>|/usr/autodesk/maya$_mayaver/plug-ins/bifrost|g" usr/autodesk/modules/maya/$_mayaver/bifrost.mod
    sed -i "s|<PLUGIN_DIR>|/usr/autodesk/maya$_mayaver/plug-ins/vnn|g" usr/autodesk/modules/maya/$_mayaver/vnn.mod
}

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya$_mayaver/"{modules,plug-ins}
    mv usr/autodesk/modules/maya/$_mayaver/*.mod "$pkgdir/usr/autodesk/maya$_mayaver/modules/"
    mv usr/autodesk/bifrost/maya$_mayaver/$pkgver/* "$pkgdir/usr/autodesk/maya$_mayaver/plug-ins/"
    install -Dm644 "$srcdir/EULA/English.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
