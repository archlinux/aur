# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=drawio
pkgver=20.7.4
pkgrel=1
pkgdesc="Diagram drawing application built on web technology"
arch=("any")
url="https://github.com/jgraph/drawio"
license=("Apache")
options=(!strip)
source=("draw-${pkgver}.war::https://github.com/jgraph/drawio/releases/download/v${pkgver}/draw.war")
sha256sums=("67219941033c7bf8c68dc15affd30c503fbfb2e174d6a29559ce7cf89becfa30")

prepare() {
    rm -rf META-INF WEB-INF
    rm -f yarn.lock
    rm -f service-worker.js

    sed -i '/<!--.*\[if IE\].*\[endif\]-->/d' index.html
    sed -i '/itemprop="image".*googleusercontent/d' index.html
    sed -i '/rel="chrome-webstore-item"/d' index.html
    sed -i '/rel="preconnect".*googleapis\.com/d' index.html
    sed -i '/rel="canonical".*app\.diagrams\.net/d' index.html
    sed -i '/itemprop="image".*googleusercontent/d' teams.html
    sed -i '/rel="chrome-webstore-item"/d' teams.html
    sed -i '/rel="preconnect".*googleapis\.com/d' teams.html
    sed -i 's/return false/return true/' disableUpdate.js
    sed -i "s/'electron': 'plugins\/electron.js',//" js/diagramly/App.js
    rm -f electron.js electronFilesWorker.js plugins/electron.js
}

package() {
    install -dm755 "${pkgdir}/usr/share"

    cp -r . "${pkgdir}/usr/share/draw.io"
    rm "${pkgdir}/usr/share/draw.io/draw-${pkgver}.war"

    chmod -R 0000 "${pkgdir}/usr/share/draw.io"
    chmod -R u+rwX,g+rX,o+rX "${pkgdir}/usr/share/draw.io"
}
