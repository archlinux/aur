# Maintainer: William Tang <galaxyking0419@gmail.com>

_mayaver=2024

pkgname=maya-bifrost
pkgver=2.8.0.0
pkgrel=1
pkgdesc='Autodesk Maya Bifrost Plugin'
arch=('x86_64')
url='https://area.autodesk.com/bifrost/'
license=('custom')
depends=('maya>=2024' 'maya<2025.0')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://Bifrost_${pkgver}_Maya${_mayaver}_Linux.run")
b2sums=('9621b2cc23d1eb7ac20b385d79eecdc051829772f6c5ad01886cfcdebb20f2ed61d504d4fcfc85b574fe82db11c77335976bf4b3139bf487cd4092f09451c9f2')

options=(!strip)

prepare() {
    chmod +x ./Bifrost_${pkgver}_Maya${_mayaver}_Linux.run
    ./Bifrost_${pkgver}_Maya${_mayaver}_Linux.run --target extracted --phase2 --noexec
    echo 'Extracting rpm...'
    bsdtar -xf extracted/*.rpm
    sed -i "s|<BIFROST_DIR>|/usr/autodesk/maya$_mayaver/plug-ins/bifrost|g" usr/autodesk/modules/maya/$_mayaver/bifrost.mod
    sed -i "s|<PLUGIN_DIR>|/usr/autodesk/maya$_mayaver/plug-ins/vnn|g" usr/autodesk/modules/maya/$_mayaver/vnn.mod
}

package() {
    mkdir -p $pkgdir/usr/autodesk/maya$_mayaver/{modules,plug-ins}
    mv usr/autodesk/modules/maya/$_mayaver/*.mod $pkgdir/usr/autodesk/maya$_mayaver/modules/
    mv usr/autodesk/bifrost/maya$_mayaver/$pkgver/* $pkgdir/usr/autodesk/maya$_mayaver/plug-ins/
}
