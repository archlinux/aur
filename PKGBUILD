pkgname=firefox-extension-adguard
pkgver=5.0.171
pkgrel=2
pkgdesc="AdGuard browser extension."
arch=("any")
url="https://adguard.com/adguard-browser-extension/overview.html"
license=("GPL-3.0-only")
groups=("firefox-addons")
makedepends=("pnpm" "git" "jq" "nodejs-lts-iron")
source=("AdguardBrowserExtension-$pkgver.tar.gz::https://github.com/AdguardTeam/AdguardBrowserExtension/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('096ceba88adf3f131314659d26020588d28e27fdb9edbc60585bab64895d86c8')

prepare() {
    cd "$srcdir/AdguardBrowserExtension-$pkgver"
    pnpm install
}
build() {
    cd "$srcdir/AdguardBrowserExtension-$pkgver"
    pnpm run release firefox
}
check() {
    cd "$srcdir/AdguardBrowserExtension-$pkgver"
    pnpm test
}
package() {
    depends=("firefox")
    id=$(jq -r .browser_specific_settings.gecko.id "$srcdir/AdguardBrowserExtension-$pkgver/build/release/firefox-amo/manifest.json")
    install -Dm644 "$srcdir/AdguardBrowserExtension-$pkgver/build/release/firefox.zip" \
        "$pkgdir/usr/lib/firefox/browser/extensions/$id.xpi"
}
