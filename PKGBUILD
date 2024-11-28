# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=maya-arnold
pkgver=5.4.6
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://arnoldrenderer.com/download/'
license=('custom')
depends=('maya>=2024' 'maya<2025')
optdepends=('maya-usd: Universal scene description support'
            'maya-bifrost: Bifrost effects support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from Autodesk.com')
source=("manual://MtoA-${pkgver}-linux-2024.run")
b2sums=('e488a75c61467565acff2fd399a920aa216a1ddacd41e11996fc43dc8d91055d0f8b74d60bab3c77c360e6f37351d29c5dfaecae348d93bfd5e1f461cfc2e3f6')

options=(!strip)

prepare() {
    rm -Rf extracted
    chmod +x ./MtoA-${pkgver}-linux-2024.run
    ./MtoA-${pkgver}-linux-2024.run --tar xvf
    mkdir extracted
    echo 'Extracting zip...'
    bsdtar -xf *.zip --directory extracted
    sed -i 's|any .|any /usr/autodesk/maya2024/plug-ins/arnold|g' extracted/mtoa.mod
}

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya2024/"{modules,plug-ins/arnold}

    mv extracted/mtoa.mod "$pkgdir/usr/autodesk/maya2024/modules/"
    mv extracted/* "$pkgdir/usr/autodesk/maya2024/plug-ins/arnold/"
}
