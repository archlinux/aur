# Maintainer: Franck Stauffer <franck.stauffer@telecom-sudparis.eu>

pkgname='firefox-extension-cookie-autodelete'
pkgver=3.4.0
pkgrel=3
pkgdesc="Firefox extension that automatically deletes cookies."
license=('MIT')
arch=('any')
url="https://github.com/Cookie-AutoDelete/Cookie-AutoDelete"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Cookie-AutoDelete/Cookie-AutoDelete/archive/v$pkgver.tar.gz")
b2sums=('09fb14d9950982ab503c6f8489e6acd7435e1bc1a2f3815adde891021c17ffe243bb56687a8a940d1c08a66a273a965d4e0397c2c9940d10218751c317976494')

prepare() {
    npm --silent -C "Cookie-AutoDelete-$pkgver" install

    # Fix possible vulnerabilities in npm dependencies
    npm --silent -C "Cookie-AutoDelete-$pkgver" audit fix

    # Force to build release for $pkgver
    sed -i "s/let versionTag = process.env.GITHUB_REF || process.env.TRAVIS_TAG || '';/let versionTag = '$pkgver'/"  "Cookie-AutoDelete-$pkgver/tools/buildFilesDev.js"
    sed -i "s/let versionTag = process.env.GITHUB_REF || process.env.TRAVIS_TAG || '';/let versionTag = '$pkgver'/"  "Cookie-AutoDelete-$pkgver/tools/replaceVersionNumber.js"
    sed -i "s/3.999.999/$pkgver/" "Cookie-AutoDelete-$pkgver/extension/manifest.json"
}

build() {
    npm --silent -C "Cookie-AutoDelete-$pkgver" run build
}

package() {
    cd  "Cookie-AutoDelete-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd builds
    install -Dm644 "Cookie-AutoDelete_${pkgver}_Firefox.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/CookieAutoDelete@kennydo.com.xpi"
}
