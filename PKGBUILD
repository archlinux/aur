pkgname=firefox-extension-adguard
pkgver=5.0.185
pkgrel=1
pkgdesc="AdGuard browser extension."
arch=("any")
url="https://adguard.com/adguard-browser-extension/overview.html"
license=("GPL-3.0-only")
groups=("firefox-addons")
makedepends=("pnpm" "git" "jq" "nodejs-lts-iron")
source=("AdguardBrowserExtension-$pkgver.tar.gz::https://github.com/AdguardTeam/AdguardBrowserExtension/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c1a3c7c56e6182564a5a5f26c0ad2399a9240ddba353e2c730178260311cee84')

prepare() {
    cd "$srcdir/AdguardBrowserExtension-$pkgver"
    sed -i "/'stream': require.resolve('stream-browserify'),/a 'vm': require.resolve('vm-browserify')," \
        tools/bundle/webpack.common.js
    sed -i "/'nanoid',/a 'sinon'," \
        jest.config.ts
    pnpm add vm-browserify
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
