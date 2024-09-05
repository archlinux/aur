# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=maya-arnold
pkgver=5.4.4
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
b2sums=('c6d4c275071c1467557df97accf4fc342f4f9fe8672122151b199db5b4356bdd15ca61ca81e85ffbf64a4286df5e4254c559e3fa96469092e50abb5f6d064719')

options=(!strip)

prepare() {
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
