# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=drawio
pkgver=14.8.0
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
options=(!strip)
source=(
    "https://github.com/jgraph/drawio/releases/download/v${pkgver}/draw.war"
)
sha256sums=(
    "f4d89497132cc6f10f3b0a33297d101e1b09422019a5b1ec49d4a8442307adb6"
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
