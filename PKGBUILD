# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: mutantmonkey <mutantmonkey@mutantmonkey.in>

_dver=231203
pkgname=firefox-extension-scriptish
pkgver=0.1.11.1
pkgrel=3
pkgdesc="A Script Extension Manager for Firefox."
url="https://addons.mozilla.org/firefox/addon/scriptish/"
depends=("firefox")
makedepends=('unzip')
license=('MPL2')
arch=('any')
source=("https://addons.mozilla.org/firefox/downloads/latest/${_dver}/addon-${_dver}-latest.xpi")
sha256sums=('403dd50a57df9a7a9f583b2cf65beb6c2ffdb9532ecfc0c6c7e0a7778d3a6476')
noextract=(addon-${_dver}-latest.xpi)

pkgver() {
    sed -n '/.*<em:version>\(.*\)<\/em:version>.*/{s//\1/p;q}' install.rdf | cut -f 1 -d-
}

prepare(){
    unzip -qqo addon-${_dver}-latest.xpi
}

package() {
    cd "$srcdir"
    emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
    local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/${emid}"
    install -d "$dstdir"
    rm *.xpi
    cp -dpr --no-preserve=ownership * "$dstdir"
    chmod -R 755 "$dstdir"
}
