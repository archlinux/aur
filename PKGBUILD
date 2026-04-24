# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2027

pkgname=maya-bifrost
pkgver=3.1.0.8
pkgrel=1
pkgdesc='Autodesk Maya Bifrost Plugin'
arch=('x86_64')
url='https://area.autodesk.com/bifrost/'
license=('custom')
depends=("maya>=${_mayaver}" 'maya<2028.0')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://Bifrost_${pkgver}_Maya${_mayaver}_Linux.run")
b2sums=('bdce7236f58db1db9e96f27190224b58dca4933ddc33b0704bd95db11ef86daaa5147dc189680d7eb82fdd132ee856f4fd0b922a2908d019b4c7e2670a847998')

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
