# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026
_mayaminor=2

pkgname=maya-usd-bin
pkgver=0.33.0
pkgrel=1
pkgdesc='Autodesk Maya Universal Scene Description Plugin'
arch=('x86_64')
url='https://github.com/Autodesk/maya-usd'
license=('Apache')
depends=("maya=$_mayaver.$_mayaminor")
provides=('maya-usd')
conflicts=('maya-usd')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("https://github.com/Autodesk/maya-usd/releases/download/v${pkgver}/MayaUSD_${pkgver}_Maya${_mayaver}.${_mayaminor}_Linux.run")
b2sums=('6ea4ee2184e1dc7ea637fb7f6327cf7b45083e1a70532bcd50be12a2bf22501ee397a657c40bb638ac11e73fd348acfe5fbd28edc2c9ced8a9c3306734b52844')

options=(!strip)

prepare() {
    chmod +x ./MayaUSD_${pkgver}_Maya${_mayaver}.${_mayaminor}_Linux.run
    rm -f *.rpm
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
