# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=drawio
pkgver=14.9.3
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
options=(!strip)
source=(
    "draw-${pkgver}.war::https://github.com/jgraph/drawio/releases/download/v${pkgver}/draw.war"
)
sha256sums=(
    "23db4634e623f27958e5fca57c5963e15d6f0aa5731704e2c9f1aa41e3c67dab"
)

prepare() {
    rm -rf META-INF WEB-INF
    rm -f yarn.lock
    rm -f service-worker.js

    sed -i '/<!--.*\[if IE\].*\[endif\]-->/d' index.html
    sed -i 's/return false/return true/' disableUpdate.js
    sed -i "s/'electron': 'plugins\/electron.js',//" js/diagramly/App.js
    rm -f electron.js electronFilesWorker.js plugins/electron.js
}

package() {
    install -dm755 "${pkgdir}/usr/share"

    cp -r . "${pkgdir}/usr/share/draw.io"
    rm "${pkgdir}/usr/share/draw.io/draw.war"

    chmod -R 0000 "${pkgdir}/usr/share/draw.io"
    chmod -R u+rwX,g+rX,o+rX "${pkgdir}/usr/share/draw.io"
}
