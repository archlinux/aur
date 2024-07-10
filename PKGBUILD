pkgname=firefox-extension-adguard
pkgver=4.3.64
pkgrel=1
pkgdesc="AdGuard browser extension."
arch=("any")
url="https://adguard.com/adguard-browser-extension/overview.html"
license=("GPL-3.0-only")
groups=("firefox-addons")
makedepends=("npm" "yarn" "git" "jq")
options=("!strip")
source=("adguard-$pkgver.tar.gz::https://github.com/AdguardTeam/AdguardBrowserExtension/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eb4169654dc8f77c291e6caf407657a85b575ea6ebdea615b9445bae759a0427')

prepare() {
    cd "$srcdir/AdguardBrowserExtension-$pkgver"
    yarn install --ignore-scripts --ignore-engines
    if [[ -z "$OPENAI_API_KEY" ]]
    then
        # This needs an OPENAI_API_KEY
        sed -i 's|await findDangerousRules();|//await findDangerousRules();|' \
            ./tools/resources.ts
    fi
    yarn resources
}
build() {
    cd "$srcdir/AdguardBrowserExtension-$pkgver"
    yarn release firefox
}
check() {
    cd "$srcdir/AdguardBrowserExtension-$pkgver"
    yarn test
}
package() {
    depends=("firefox")
    id=$(jq -r .browser_specific_settings.gecko.id "$srcdir/AdguardBrowserExtension-$pkgver/build/release/firefox-amo/manifest.json")
    install -Dm644 "$srcdir/AdguardBrowserExtension-$pkgver/build/release/firefox.zip" \
        "$pkgdir/usr/lib/firefox/browser/extensions/$id.xpi"
}
