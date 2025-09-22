pkgname=firefox-extension-adguard
pkgver=5.2.77
pkgrel=1
pkgdesc="AdGuard browser extension."
arch=("any")
url="https://adguard.com/adguard-browser-extension/overview.html"
license=("GPL-3.0-only")
groups=("firefox-addons")
makedepends=("pnpm" "git" "jq" "nodejs-lts-jod")
source=("AdguardBrowserExtension-$pkgver.tar.gz::https://github.com/AdguardTeam/AdguardBrowserExtension/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52f76f7ea0191ee18a043c2dc0b28ba8312830b4310ab8d95d87b36c5f1cd657')

prepare() {
    cd "$srcdir/AdguardBrowserExtension-$pkgver"
    pnpm install --silent --ignore-scripts
}
build() {
    cd "$srcdir/AdguardBrowserExtension-$pkgver"
    pnpm run release firefox-standalone
}
check() {
    cd "$srcdir/AdguardBrowserExtension-$pkgver"
    pnpm test
}
package() {
    depends=("firefox")
    id=$(jq -r .browser_specific_settings.gecko.id "$srcdir/AdguardBrowserExtension-$pkgver/build/release/firefox-standalone/manifest.json")
    install -Dm644 "$srcdir/AdguardBrowserExtension-$pkgver/build/release/firefox-standalone.zip" \
        "$pkgdir/usr/lib/firefox/browser/extensions/$id.xpi"
}
