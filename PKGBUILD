pkgname=firefox-extension-adguard
pkgver=5.4.2.0
#_tag=v${pkgver%.*}+${pkgver##*.}.build.20251216080045
_tag=v$pkgver
pkgrel=1
pkgdesc="AdGuard browser extension."
arch=("any")
url="https://adguard.com/adguard-browser-extension/overview.html"
license=("GPL-3.0-only")
groups=("firefox-addons")
makedepends=("pnpm" "git" "jq" "nodejs-lts-jod")
source=("AdguardBrowserExtension-$pkgver.tar.gz::https://github.com/AdguardTeam/AdguardBrowserExtension/archive/refs/tags/$_tag.tar.gz")
sha256sums=('8952b1e4b32ffef983b279675533191b83d78ae6013ea06cb154c26283838b29')
_version=${_tag//+/-}
_version=${_version#v}

prepare() {
    cd "$srcdir/AdguardBrowserExtension-${_version}"
    pnpm install --silent --ignore-scripts
}
build() {
    cd "$srcdir/AdguardBrowserExtension-${_version}"
    pnpm run release firefox-amo --zip
}
check() {
    cd "$srcdir/AdguardBrowserExtension-${_version}"
    pnpm test
}
package() {
    depends=("firefox")

    cd "$srcdir/AdguardBrowserExtension-${_version}"
    id="$(jq -r .browser_specific_settings.gecko.id "./build/release/firefox-amo/manifest.json")"
    echo "Found extension id: $id"
    install -Dm644 "./build/release/firefox-amo.zip" "$pkgdir/usr/lib/firefox/browser/extensions/$id.xpi"
}
