# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026
_mayaminor=1

pkgname=maya-usd-bin
pkgver=0.32.0
pkgrel=2
pkgdesc='Autodesk Maya Universal Scene Description Plugin'
arch=('x86_64')
url='https://github.com/Autodesk/maya-usd'
license=('Apache')
depends=("maya=$_mayaver.$_mayaminor")
provides=('maya-usd')
conflicts=('maya-usd')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("https://github.com/Autodesk/maya-usd/releases/download/v${pkgver}/MayaUSD_${pkgver}_Maya${_mayaver}.${_mayaminor}_Linux.run")
b2sums=('dccd645cc31bcdbca587fb130d10a23d56c08c0dcb5ea33aaebe7be7e17cc942773cdeb324b12cc6e0f3c5795ca09173bc6ea3dc46d174e03024eb5f07223e91')

options=(!strip)

prepare() {
    chmod +x ./MayaUSD_${pkgver}_Maya${_mayaver}_Linux.run
    rm *.rpm
    ./MayaUSD_${pkgver}_Maya${_mayaver}_Linux.run --tar xvf
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
