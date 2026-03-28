# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayasver=2027
_mayaver=2027

pkgname=maya-usd-bin
pkgver=0.35.0
pkgrel=2
pkgdesc='Autodesk Maya Universal Scene Description Plugin'
arch=('x86_64')
url='https://github.com/Autodesk/maya-usd'
license=('Apache-2.0')
depends=("maya>=$_mayaver" "maya<2028")
provides=('maya-usd')
conflicts=('maya-usd')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("https://github.com/Autodesk/maya-usd/releases/download/v${pkgver}/MayaUSD_${pkgver}_Maya${_mayaver}_Linux.run")
b2sums=('ed2b91a76e5a993b8ede861acc48e88de5e4a63b4e1147622ba96a3732c1deb40fde6efdc8157c07e03decdca43fa2f0f5f591001945fb04ca029849e9dfcf17')

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
