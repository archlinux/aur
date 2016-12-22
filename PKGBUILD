# Maintainer: Saeroshi	<saeroshi@serenix.xyz>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>

pkgname=firefox-extension-keefox
pkgver=1.6.4
pkgrel=1
pkgdesc="Adds free, secure and easy to use password management features to Firefox"
url="https://addons.mozilla.org/firefox/addon/keefox/"
depends=('firefox' 'keepass-plugin-rpc')
makedepends=('unzip')
license=('MPL2')
arch=('any')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/539988/keefox-${pkgver}-fx+tb-linux.xpi?src=api")
sha256sums=('8766c2b8aac0c5d3ee95762ade0d9f8effdf2a0f9ec3e217c8eb3c3259d1f0e3')
noextract=("${pkgname}-${pkgver}.xpi")

pkgver() {
    sed -n '/.*<em:version>\(.*\)<\/em:version>.*/{s//\1/p;q}' install.rdf | cut -f 1 -d-
}

prepare(){
    unzip -qqo ${pkgname}-${pkgver}.xpi
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
