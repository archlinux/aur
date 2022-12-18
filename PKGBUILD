# Maintainer: William Tang <galaxyking0419@gmail.com>

_mayaver=2023

pkgname=maya-usd
pkgver=0.20.0
pkgrel=1
pkgdesc='Autodesk Maya Universal Scene Discription Plugin'
arch=('x86_64')
url='https://github.com/Autodesk/maya-usd'
license=('custom')
depends=('maya>=2023.0' 'maya<2024.0')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://MayaUSD$_mayaver-202211021008-b68700b-$pkgver-1.x86_64.rpm"
        "updateSchemaWithSdrNode-onload-SyntaxError.patch")
sha256sums=('dfa10f772743172bb42770cb14bef8858b49121bf33585e635264d7b6b2be83c'
            '3a0be2176751dd51933d7ac6896324f674fa3c3120d520c21f51257d7c1c7c1e')

options=(!strip)

prepare() {
    sed -i "s|<PLUGIN_DIR>|/usr/autodesk/maya$_mayaver/plug-ins/mayausd|g" usr/autodesk/modules/maya/$_mayaver/mayausd.mod
    sed -i 's/\$MAYA_PYTHON_VERSION/3/g' usr/autodesk/modules/maya/$_mayaver/mayausd.mod
    patch --directory="usr" --forward --strip=1 --input="${srcdir}/updateSchemaWithSdrNode-onload-SyntaxError.patch"
}

package() {
    mkdir -p $pkgdir/usr/autodesk/maya$_mayaver/{modules,plug-ins/mayausd}
    mv usr/autodesk/modules/maya/$_mayaver/mayausd.mod $pkgdir/usr/autodesk/maya$_mayaver/modules/
    mv usr/autodesk/mayausd/maya$_mayaver/${pkgver}_202211021008-b68700b/mayausd/* $pkgdir/usr/autodesk/maya$_mayaver/plug-ins/mayausd/
}
