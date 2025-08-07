# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026

pkgname=maya-bifrost
pkgver=2.14.1.0
pkgrel=1
pkgdesc='Autodesk Maya Bifrost Plugin'
arch=('x86_64')
url='https://area.autodesk.com/bifrost/'
license=('custom')
depends=('maya>=2026' 'maya<2027.0')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://Bifrost_${pkgver}_Maya${_mayaver}_Linux.run")
b2sums=('d426dd299a2b77e34afcc9971d60e6f6e4c82100598145c93cba7e4ae2f0d0d1d289db4fed82797f725938a98b175cf6642dd025009a013ba2a13f9efce87d9e')

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
