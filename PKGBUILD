pkgname=firefox-extension-adguard
pkgver=5.5.1.0
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
sha256sums=('53792b2592f9e18e00078fe21a3b9573c59ed96c8b7478f780bfd0a6a7ba4eab')
_version=${_tag//+/-}
_version=${_version#v}

prepare() {
    cd "$srcdir/AdguardBrowserExtension-${_version}"
    sed -i 's/<11/<12/' package.json
    pnpm install --ignore-scripts
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
