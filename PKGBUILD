# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayasver=2026
_mayaver=2026.3

pkgname=maya-usd-bin
pkgver=0.35.0
pkgrel=1
pkgdesc='Autodesk Maya Universal Scene Description Plugin'
arch=('x86_64')
url='https://github.com/Autodesk/maya-usd'
license=('Apache')
depends=("maya>=$_mayaver" "maya<2027")
provides=('maya-usd')
conflicts=('maya-usd')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("https://github.com/Autodesk/maya-usd/releases/download/v${pkgver}/MayaUSD_${pkgver}_Maya${_mayaver}_Linux.run")
b2sums=('c5f498707e53b5e00b082bd5e8649f3df8bd3e73d1067ffec22253dc4dc10f2aa9c95749b8c81e16d5d50547e0e0b44f5bd8156eb24d2c03342e79cf150618e0')

options=(!strip)

prepare() {
    chmod +x ./MayaUSD_${pkgver}_Maya${_mayaver}_Linux.run
    rm -f *.rpm
    ./MayaUSD_${pkgver}_Maya${_mayaver}_Linux.run --tar xvf
    echo 'Extracting rpm...'
    bsdtar -xf *.rpm
    sed -i "s|<PLUGIN_DIR>|/usr/autodesk/maya$_mayasver/plug-ins/mayausd|g" usr/autodesk/modules/maya/$_mayasver/mayausd.mod
    sed -i 's/\$MAYA_PYTHON_VERSION/3/g' usr/autodesk/modules/maya/$_mayasver/mayausd.mod
}

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya$_mayasver/"{modules,plug-ins/mayausd}
    mv usr/autodesk/modules/maya/$_mayasver/mayausd.mod "$pkgdir/usr/autodesk/maya$_mayasver/modules/"
    mv usr/autodesk/mayausd/maya$_mayasver/${pkgver}_*/mayausd/* "$pkgdir/usr/autodesk/maya$_mayasver/plug-ins/mayausd/"
}
