# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2024
_mayaminor=2

pkgname=maya-usd-bin
pkgver=0.26.0
pkgrel=1
pkgdesc='Autodesk Maya Universal Scene Description Plugin'
arch=('x86_64')
url='https://github.com/Autodesk/maya-usd'
license=('Apache')
depends=("maya=$_mayaver.$_mayaminor")
provides=('maya-usd')
conflicts=('maya-usd')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("https://github.com/Autodesk/maya-usd/releases/download/v${pkgver}/MayaUSD_${pkgver}_Maya$_mayaver.${_mayaminor}_Linux.run")
b2sums=('e565ffa0f709c2ff53146f49b03ca6ee3a08e608ed7333ea5f67d27cbf17a612322d31563c3018b7390d8bfbb1a89dfc733d16701f0e7571244dc37444036089')

options=(!strip)

prepare() {
    chmod +x ./MayaUSD_${pkgver}_Maya${_mayaver}.${_mayaminor}_Linux.run
    ./MayaUSD_${pkgver}_Maya${_mayaver}.${_mayaminor}_Linux.run --tar xvf
    echo 'Extracting rpm...'
    bsdtar -xf *.rpm
    sed -i "s|<PLUGIN_DIR>|/usr/autodesk/maya$_mayaver/plug-ins/mayausd|g" usr/autodesk/modules/maya/$_mayaver/mayausd.mod
    sed -i 's/\$MAYA_PYTHON_VERSION/3/g' usr/autodesk/modules/maya/$_mayaver/mayausd.mod
}

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya$_mayaver/"{modules,plug-ins/mayausd}
    mv usr/autodesk/modules/maya/$_mayaver/mayausd.mod "$pkgdir/usr/autodesk/maya$_mayaver/modules/"
    mv usr/autodesk/mayausd/maya$_mayaver/${pkgver}_*/mayausd/* "$pkgdir/usr/autodesk/maya$_mayaver/plug-ins/mayausd/"
}
