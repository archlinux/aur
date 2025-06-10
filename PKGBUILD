# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026

pkgname=maya-arnold
pkgver=5.5.2.1
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
b2sums=('73f2e6a644b35ba53f1d1dcafe1ea9dc5fff9f7909668cdb8070db2e8760c7d2976c532504086a988fde8b1046df49bfa6bb94eb3abd971e7cc324714f7e0583')

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
