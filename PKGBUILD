pkgname=firefox-extension-adguard
pkgver=5.2.112.84
_tag=${pkgver%.*}+${pkgver##*.}.build.20251022090039
pkgrel=1
pkgdesc="AdGuard browser extension."
arch=("any")
url="https://adguard.com/adguard-browser-extension/overview.html"
license=("GPL-3.0-only")
groups=("firefox-addons")
makedepends=("pnpm" "git" "jq" "nodejs-lts-jod")
source=("AdguardBrowserExtension-$pkgver.tar.gz::https://github.com/AdguardTeam/AdguardBrowserExtension/archive/refs/tags/v$_tag.tar.gz")
sha256sums=('28fb0bf268742cc0253da78268f4fcce1eb8583369f93bbfad03be46cc49b0f7')

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
