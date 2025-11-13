# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2026

pkgname=maya-arnold
pkgver=5.5.5
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
b2sums=('2c8237f47e28e134261a2b59f1116530dab3c18bb97d40c59b3a1faacdb34bd9dcd2f8085ede51b934c6d729f92e8982a8a3258b15a152df7055e1aa4fecb7bd')

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
