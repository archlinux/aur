# Maintainer: FadeMind <fademind@gmail.com>

_plugin_name=bookmarks_checker_check_for_bad_links
_dver=431790
pkgname=firefox-extension-bookmarks-checker
pkgver=5.8.1
pkgrel=1
pkgdesc="Check favorites for broken or bad links"
url="https://addons.mozilla.org/firefox/addon/bookmarks-checker/"
depends=("firefox")
makedepends=('unzip')
license=('MPL2')
arch=('any')
source=("https://addons.mozilla.org/firefox/downloads/latest/${_dver}/addon-${_dver}-latest.xpi")
sha256sums=('90162246d5fa49a58bed8390a7d5cb7d4507a3389a4edc0bbd275c6637d2d749')
noextract=(addon-${_dver}-latest.xpi)

pkgver() {
    sed -n '/.*<em:version>\(.*\)<\/em:version>.*/{s//\1/p;q}' install.rdf | cut -f 1 -d-
}

prepare(){
    unzip -qqo addon-${_dver}-latest.xpi
}

package() {
    cd "$srcdir"
    emid=$(grep -Pom1 'id>\K[^<]*' install.rdf)
    local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/${emid}"
    install -d "$dstdir"
    rm *.xpi
    cp -dpr --no-preserve=ownership * "$dstdir"
    chmod -R 755 "$dstdir"
}
