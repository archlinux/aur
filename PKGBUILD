# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Daniel Nagy <danielnagy at gmx de>

_dver=456474
pkgname=firefox-extension-feedly-notifier
pkgver=2.11.2
pkgrel=1
pkgdesc="Firefox extension for reading news from rss aggregator Feedly"
url="https://addons.mozilla.org/firefox/addon/feedly-notifier/"
depends=("firefox")
makedepends=('unzip')
license=('MPL2')
arch=('any')
source=("https://addons.mozilla.org/firefox/downloads/latest/${_dver}/addon-${_dver}-latest.xpi")
sha256sums=('db85459a0d9c25240f1a8b05c55e6a92aff64acb7c5ce68d9ae68c9f8c5af5f9')
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
