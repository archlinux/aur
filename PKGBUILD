# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

_mayaver=2027

pkgname=maya-arnold
pkgver=5.6.2.1
pkgrel=1
pkgdesc='Autodesk Maya Arnold Renderer Plugin'
arch=('x86_64')
url='https://arnoldrenderer.com/download/'
license=('custom')
depends=("maya>=${_mayaver}" 'maya<2028')
optdepends=('maya-usd: Universal scene description support'
            'maya-bifrost: Bifrost effects support')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from Autodesk.com')
source=("manual://MtoA-${pkgver}-linux-${_mayaver}.run")
b2sums=('e2f594495761049435bd8c033c8b7dd08770b232bf1f166dcc429279c30db60de8aa9b32e3a4741f93b4ed5f7bcc605ca8c9f3f676791357d3c238b7f23210eb')

options=(!strip)

prepare() {
    rm -Rf extracted
    chmod +x ./MtoA-${pkgver}-linux-${_mayaver}.run
    ./MtoA-${pkgver}-linux-${_mayaver}.run --tar xvf
    mkdir extracted
    echo 'Extracting tgz...'
    bsdtar -xf *.tgz --directory extracted
    sed -i "s|any .|any /usr/autodesk/maya${_mayaver}/plug-ins/arnold|g" extracted/mtoa.mod
}

package() {
    mkdir -p "$pkgdir/usr/autodesk/maya${_mayaver}/"{modules,plug-ins/arnold}

    mv extracted/mtoa.mod "$pkgdir/usr/autodesk/maya${_mayaver}/modules/"
    mv extracted/* "$pkgdir/usr/autodesk/maya${_mayaver}/plug-ins/arnold/"
}
