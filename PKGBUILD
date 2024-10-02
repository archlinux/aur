pkgname=firefox-extension-adguard
pkgver=5.0.113
pkgrel=1
pkgdesc="AdGuard browser extension."
arch=("any")
url="https://adguard.com/adguard-browser-extension/overview.html"
license=("GPL-3.0-only")
groups=("firefox-addons")
makedepends=("npm" "yarn" "git" "jq" "nodejs-lts-iron")
source=("AdguardBrowserExtension-$pkgver.tar.gz::https://github.com/AdguardTeam/AdguardBrowserExtension/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('50c0df5c80f901cdf18b98cc978d1023b2b24e667d4e919163ccc17d46151fe4')

prepare() {
    cd "$srcdir/AdguardBrowserExtension-$pkgver"
    yarn install --ignore-scripts --ignore-engines
}
build() {
    cd "$srcdir/AdguardBrowserExtension-$pkgver"
    yarn release firefox
}
check() {
    cd "$srcdir/AdguardBrowserExtension-$pkgver"
    yarn test
}
package() {
    depends=("firefox")
    id=$(jq -r .browser_specific_settings.gecko.id "$srcdir/AdguardBrowserExtension-$pkgver/build/release/firefox-amo/manifest.json")
    install -Dm644 "$srcdir/AdguardBrowserExtension-$pkgver/build/release/firefox.zip" \
        "$pkgdir/usr/lib/firefox/browser/extensions/$id.xpi"
}
