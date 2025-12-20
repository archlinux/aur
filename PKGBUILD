pkgname=firefox-extension-adguard
pkgver=5.2.700.1
_tag=v${pkgver%.*}+${pkgver##*.}.build.20251216080045
pkgrel=1
pkgdesc="AdGuard browser extension."
arch=("any")
url="https://adguard.com/adguard-browser-extension/overview.html"
license=("GPL-3.0-only")
groups=("firefox-addons")
makedepends=("pnpm" "git" "jq" "nodejs-lts-jod")
source=("AdguardBrowserExtension-$pkgver.tar.gz::https://github.com/AdguardTeam/AdguardBrowserExtension/archive/refs/tags/$_tag.tar.gz")
sha256sums=('97bbf661e1b97f61ee0714319a72e6c2e7c3e5421a07831e2befa8f018315352')
_version=${_tag//+/-}
_version=${_version#v}

prepare() {
    cd "$srcdir/AdguardBrowserExtension-${_version}"
    pnpm install --silent --ignore-scripts
}
build() {
    cd "$srcdir/AdguardBrowserExtension-${_version}"
    pnpm run release firefox-standalone
}
check() {
    cd "$srcdir/AdguardBrowserExtension-${_version}"
    pnpm test
}
package() {
    depends=("firefox")

    cd "$srcdir/AdguardBrowserExtension-${_version}"
    id="$(jq -r .browser_specific_settings.gecko.id "./build/release/firefox-standalone/manifest.json")"
    echo "Found extension id: $id"
    install -Dm644 "./build/release/firefox-standalone.zip" "$pkgdir/usr/lib/firefox/browser/extensions/$id.xpi"
}
