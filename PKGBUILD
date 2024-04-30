pkgname="firefox-extension-plasma-integration"
pkgver=1.9
pkgrel=2
pkgdesc="KDE plasma browser integration extension for firefox"
arch=("any")
url="https://community.kde.org/Plasma/Browser_Integration"
license=("CC0-1.0 AND GPL-2.0-or-later AND GPL-3.0-or-later AND MIT")
makedepends=("web-ext" "jq")
source=("https://invent.kde.org/plasma/plasma-browser-integration/-/archive/browser/$pkgver/plasma-browser-integration-browser-$pkgver.tar.gz")
sha256sums=('da4eda213b4cfc5cecbaadbf18870b07cb0c8da7482e2f604e5d52458309286d')

build(){
    cd "$srcdir/plasma-browser-integration-browser-$pkgver/extension"
    web-ext build -a dist
}
package(){
    depends=("plasma-browser-integration" "firefox")
    cd "$srcdir/plasma-browser-integration-browser-$pkgver/extension"
    local id=$(jq -r .applications.gecko.id manifest.json)
    echo "Firefox extension id is $id"
    install -Dm644 dist/plasma_integration-$pkgver.zip \
        "$pkgdir/usr/lib/firefox/browser/extensions/$id.xpi"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 ../LICENSES/*.txt \
        "$pkgdir/usr/share/licenses/$pkgname/"
}
