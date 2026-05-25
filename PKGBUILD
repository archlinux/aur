# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayasver=2027
_mayaver=2027.1

pkgname=maya-usd-bin
pkgver=0.36.0
pkgrel=1
pkgdesc='Autodesk Maya Universal Scene Description Plugin'
arch=('x86_64')
url='https://github.com/Autodesk/maya-usd'
license=('Apache-2.0')
depends=("maya>=$_mayaver" "maya<2028")
provides=('maya-usd')
conflicts=('maya-usd')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("https://github.com/Autodesk/maya-usd/releases/download/v${pkgver}/MayaUSD_${pkgver}_Maya${_mayaver}_Linux.run")
b2sums=('fb8ba019e045f728d6238c3fa8e620d869d8559c84d134a2fc9b0a1ea299a10250ba99106ee27392bec0a0a0697f9461b5bb78327246654606686727fa7b0f79')

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
