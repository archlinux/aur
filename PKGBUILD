pkgname=firefox-extension-adguard
pkgver=5.2.112.1
_tag=${pkgver%.*}+${pkgver##*.}.build.20251009120050
pkgrel=1
pkgdesc="AdGuard browser extension."
arch=("any")
url="https://adguard.com/adguard-browser-extension/overview.html"
license=("GPL-3.0-only")
groups=("firefox-addons")
makedepends=("pnpm" "git" "jq" "nodejs-lts-jod")
source=("AdguardBrowserExtension-$pkgver.tar.gz::https://github.com/AdguardTeam/AdguardBrowserExtension/archive/refs/tags/v$_tag.tar.gz")
sha256sums=('fa4c22b177dd06ce3359844c5ac455eaf0b47b011fd8d3ad9718263cd6335dc2')

prepare() {
    cd "$srcdir/AdguardBrowserExtension-${_tag//+/-}"
    pnpm install --silent --ignore-scripts
}
build() {
    cd "$srcdir/AdguardBrowserExtension-${_tag//+/-}"
    pnpm run release firefox-standalone
}
check() {
    cd "$srcdir/AdguardBrowserExtension-${_tag//+/-}"
    pnpm test
}
package() {
    depends=("firefox")

    cd "$srcdir/AdguardBrowserExtension-${_tag//+/-}"
    id="$(jq -r .browser_specific_settings.gecko.id "./build/release/firefox-standalone/manifest.json")"
    echo "Found extension id: $id"
    install -Dm644 "./build/release/firefox-standalone.zip" "$pkgdir/usr/lib/firefox/browser/extensions/$id.xpi"
}
