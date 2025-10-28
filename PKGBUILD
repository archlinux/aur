# Maintainer: emmanuel <emmanuelgoldstein@firemail.cc>
# Contributor: Franck Stauffer <franck.stauffer@monaco.mc>

pkgname='librewolf-extension-cookie-autodelete'
pkgver=3.8.2
pkgrel=2
pkgdesc="Librewolf extension that automatically deletes cookies."
license=('MIT')
arch=('any')
groups=('librewolf-addons')
makedepends=('npm')
url="https://github.com/Cookie-AutoDelete/Cookie-AutoDelete"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Cookie-AutoDelete/Cookie-AutoDelete/archive/v$pkgver.tar.gz")
b2sums=('07b643fa8ed7af27ce89751c1a8ca1829336f09706ee1d3b59a44823cf0af31dd9bc9772b5619f5e1327957b2bf69f7866b8ffa0fab90961c130668e37c22ccf')

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
    install -Dm644 "Cookie-AutoDelete_${pkgver}_Firefox.xpi" "$pkgdir/usr/lib/librewolf/browser/extensions/CookieAutoDelete@kennydo.com.xpi"
}
