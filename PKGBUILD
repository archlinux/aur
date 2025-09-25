# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026

pkgname=maya-arnold
pkgver=5.5.4.2
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://arnoldrenderer.com/download/'
license=('custom')
depends=("maya>=${_mayaver}" 'maya<2027')
optdepends=('maya-usd: Universal scene description support'
            'maya-bifrost: Bifrost effects support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from Autodesk.com')
source=("manual://MtoA-${pkgver}-linux-${_mayaver}.run")
b2sums=('67649a0503f77d8fc235e13b762a83a039579850c7cb77a87a94dd6761b547b1f718e3f32de75f53b96b898afcf19710fa52f86d33f638bc279eb9e902e0ebdf')

options=(!strip)

prepare() {
    rm -Rf extracted
    chmod +x ./MtoA-${pkgver}-linux-${_mayaver}.run
    ./MtoA-${pkgver}-linux-${_mayaver}.run --tar xvf
    mkdir extracted
    echo 'Extracting zip...'
    bsdtar -xf *.zip --directory extracted
    sed -i "s|any .|any /usr/autodesk/maya${_mayaver}/plug-ins/arnold|g" extracted/mtoa.mod
}

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya${_mayaver}/"{modules,plug-ins/arnold}

    mv extracted/mtoa.mod "$pkgdir/usr/autodesk/maya${_mayaver}/modules/"
    mv extracted/* "$pkgdir/usr/autodesk/maya${_mayaver}/plug-ins/arnold/"
}
