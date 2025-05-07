# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026

pkgname=maya-bifrost
pkgver=2.14.0.0
pkgrel=1
pkgdesc='Autodesk Maya Bifrost Plugin'
arch=('x86_64')
url='https://area.autodesk.com/bifrost/'
license=('custom')
depends=('maya>=2026' 'maya<2027.0')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://Bifrost_${pkgver}_Maya${_mayaver}_Linux.run")
b2sums=('2627b94f2f1157a94a4e141e00237df2c139d9862b03a3765860e4fbb20ad2881d093f2484aeef8b49f91da16d2ed6380fa7c72d492a660c57a43d608f987798')

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
