pkgname="firefox-extension-plasma-integration"
pkgver=2.0
pkgrel=2
pkgdesc="KDE plasma browser integration extension for firefox"
arch=("any")
url="https://community.kde.org/Plasma/Browser_Integration"
license=("CC0-1.0 AND GPL-2.0-or-later AND GPL-3.0-or-later AND MIT")
makedepends=("web-ext" "jq")
_ref="browser/$pkgver"
source=("https://invent.kde.org/plasma/plasma-browser-integration/-/archive/$_ref/plasma-browser-integration-${_ref/\//-}.tar.gz")
sha256sums=('a6d80899560857d484915045dc05cbfb64285736f28851f1f5d88c75bcc39bab')

build(){
    cd "$srcdir/plasma-browser-integration-${_ref/\//-}/extension"
    web-ext build -a dist
}
package(){
    depends=("plasma-browser-integration" "firefox")
    cd "$srcdir/plasma-browser-integration-${_ref/\//-}/extension"
    local id=$(jq -r .browser_specific_settings.gecko.id manifest.json)
    echo "Firefox extension id is $id"
    install -Dm644 dist/plasma_integration-$pkgver.zip \
        "$pkgdir/usr/lib/firefox/browser/extensions/$id.xpi"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 ../LICENSES/*.txt \
        "$pkgdir/usr/share/licenses/$pkgname/"
}
