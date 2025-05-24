pkgname=firefox-extension-adguard
pkgver=5.1.88
pkgrel=1
pkgdesc="AdGuard browser extension."
arch=("any")
url="https://adguard.com/adguard-browser-extension/overview.html"
license=("GPL-3.0-only")
groups=("firefox-addons")
makedepends=("pnpm" "git" "jq" "nodejs-lts-jod")
source=("AdguardBrowserExtension-$pkgver.tar.gz::https://github.com/AdguardTeam/AdguardBrowserExtension/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a5653b6067befbb6016fd823982e737eb915e44ff72798dc82806b426bf028ae')

prepare() {
    cd "$srcdir/AdguardBrowserExtension-$pkgver"
    pnpm install --silent --ignore-scripts
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
