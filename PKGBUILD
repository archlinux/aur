pkgname=firefox-extension-adguard
pkgver=5.4.3.1
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
sha256sums=('8dd598bed60f5f5dc847fb1d8518496a23307e3705a3d4a7971ce48d64d093a9')
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
