pkgname=firefox-extension-adguard
pkgver=5.2.113.0
_tag=${pkgver%.*}+${pkgver##*.}.build.20251022090039
pkgrel=1
pkgdesc="AdGuard browser extension."
arch=("any")
url="https://adguard.com/adguard-browser-extension/overview.html"
license=("GPL-3.0-only")
groups=("firefox-addons")
makedepends=("pnpm" "git" "jq" "nodejs-lts-jod")
source=("AdguardBrowserExtension-$pkgver.tar.gz::https://github.com/AdguardTeam/AdguardBrowserExtension/archive/refs/tags/$_tag.tar.gz")
sha256sums=('6ef1d86d886d998a232a52410464f8cb794f05f9c35b0314a94efc981b24f61f')

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
