# Maintainer: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='firefox-extension-cookie-autodelete'
pkgver=3.5.1
pkgrel=1
pkgdesc="Firefox extension that automatically deletes cookies."
license=('MIT')
arch=('any')
makedepends=('npm')
url="https://github.com/Cookie-AutoDelete/Cookie-AutoDelete"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Cookie-AutoDelete/Cookie-AutoDelete/archive/v$pkgver.tar.gz")
b2sums=('8a1a7c7f1fc76322d2cf3136c0968e402adebba62137db7a7661ccd872f12cf90275dee4d02009e2706297d283f8141acf30ccdce4095b9e30757c9f19cca968')

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

check() {
    npm --silent -C "Cookie-AutoDelete-$pkgver" test
}

package() {
    cd  "Cookie-AutoDelete-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd builds
    install -Dm644 "Cookie-AutoDelete_${pkgver}_Firefox.xpi" "$pkgdir/usr/lib/firefox/browser/extensions/CookieAutoDelete@kennydo.com.xpi"
}
