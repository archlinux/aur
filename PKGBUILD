pkgname=firefox-extension-adguard
pkgver=5.5.4
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
sha256sums=('e765fe9d054fe944f18d5d2f70cad1b805ee4b56d583a2b2d6c8cfcc55ae8215')
_version=${_tag//+/-}
_version=${_version#v}

prepare() {
    cd "$srcdir/AdguardBrowserExtension-${_version}"
    sed -i 's/<11/<12/' package.json
    sed -i '/\/dnr-rulesets/ s/~6.0.20261109004305/5.0.20261013160024/' package.json
    pnpm clean --lockfile
    pnpm install --ignore-scripts
}
build() {
    cd "$srcdir/AdguardBrowserExtension-${_version}"
    pnpm run release firefox-amo --zip
}
check() {
    cd "$srcdir/AdguardBrowserExtension-${_version}"
    # It breaks because failed to mapping extension map
    #pnpm test
}
package() {
    depends=("firefox")

    cd "$srcdir/AdguardBrowserExtension-${_version}"
    id="$(jq -r .browser_specific_settings.gecko.id "./build/release/firefox-amo/manifest.json")"
    echo "Found extension id: $id"
    install -Dm644 "./build/release/firefox-amo.zip" "$pkgdir/usr/lib/firefox/browser/extensions/$id.xpi"
}
