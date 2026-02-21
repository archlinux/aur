# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026

pkgname=maya-arnold
pkgver=5.5.6
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
b2sums=('58128aa8e49f8a818e1e2d911ce57028f21e421a2984d9ca6446f794507215cd61dc802176bd14a90bcfe54e644b411a7c81a9d951c5f14e4a43025af0715fe5')

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
