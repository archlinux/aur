pkgname="firefox-extension-plasma-integration"
pkgver=2.1.1
pkgrel=1
pkgdesc="KDE plasma browser integration extension for firefox"
arch=("any")
url="https://community.kde.org/Plasma/Browser_Integration"
license=("CC0-1.0 AND GPL-2.0-or-later AND GPL-3.0-or-later AND MIT")
makedepends=("web-ext" "jq")
_ref="browser/$pkgver"
source=("plasma-browser-integration-${_ref/\//-}.tar.gz::https://invent.kde.org/plasma/plasma-browser-integration/-/archive/$_ref/plasma-browser-integration-${_ref/\//-}.tar.gz")
sha256sums=('81ee3be873d67e62eb79b1d6ec216b77e314e86828f65011e6aa2a7f7da03065')

build(){
    cd "$srcdir/plasma-browser-integration-${_ref/\//-}/extension"
    web-ext build -a dist
}
package(){
    depends=("plasma-browser-integration" "firefox")
    cd "$srcdir/plasma-browser-integration-${_ref/\//-}/extension"
    local id=$(jq -r .browser_specific_settings.gecko.id manifest.json)
    local version="$(jq -r .version manifest.json)"
    echo "Firefox extension id is $id"
    install -Dm644 dist/plasma_integration-$version.zip \
        "$pkgdir/usr/lib/firefox/browser/extensions/$id.xpi"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 ../LICENSES/*.txt \
        "$pkgdir/usr/share/licenses/$pkgname/"
}
